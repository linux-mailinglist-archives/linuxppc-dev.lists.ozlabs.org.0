Return-Path: <linuxppc-dev+bounces-14921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113FCD2FF8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Dec 2025 14:47:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYQhH3C9xz2yFQ;
	Sun, 21 Dec 2025 00:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766238168;
	cv=none; b=YF1ewUBTiUp2/r3GAkmdkErGcjIJ7Ul+wPOmLvsI6NOna+YMmZx9S3t5J1fUWAEQp5fG042bdGrwVwEU0SqL7Ha4PnWIQBtv4yqqfJMOuD8oQH1BeQo899s13/2bKAMzBQFZi1D5aQlM7IIvj0tzs5CxJ9BYxmHRt1ndWDGskAnx5heIkadjU+0R7PkTWNAS7sarm6IQWwJFCONlkWWZ6+Ujvl/n5t3i7u3V10u4VhN8gC4fMFSgNuo1xTutHrFAnvzhB9kqIGnXjHhDQGtpZUJuqAiHja2zVPiesSegaV42rsXGXXGPm1H8V9V7gqT88gY5UEOtq3XicZhfknOlWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766238168; c=relaxed/relaxed;
	bh=9i/Z2zmeZyvtqcSLmI8gd1MhL9b7bcZrxABgSoa+UjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VyAojrR9fJAve8aKSH7j1NLAJmTDzukUDrOlP0FBH0LBOmXI+QGLt4dP6kMt/N3ewtTAKmPHaQDzf778r0jGz6tbHC8lvbln5QgKGCAn1sUzEYkvF3DweaohDhzNTsWwZWItYuwblvxTkzciAgmwWgZhJvSMcwxJKOAMHcQ94fDF4QLnNxgECKZyfrvkzPk0tbSPbECSxbuyOdCmFWrupiqqBbPhG+ZSgK/SKGmebwdZoYLjRXLzun6fW4QW+peIvRR/BmvG/NB7mAy0BSol7X6WCJ6SQu5VnAdexUSejIp+6RUQfrZ261pptcEkKE68D50q7Qwl0ZSA2P+viQQYFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYQZZ6R4Xz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 00:42:45 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-01 (Coremail) with SMTP id qwCowACHLmrHp0ZpyzpAAQ--.32777S2;
	Sat, 20 Dec 2025 21:42:31 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: chleroy@kernel.org
Cc: alex.bou9@gmail.com,
	lihaoxiang@isrc.iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	mporter@kernel.crashing.org,
	npiggin@gmail.com
Subject: Re: [PATCH] powerpc/fsl_rio: fix a improper release in fsl_rio_setup()
Date: Sat, 20 Dec 2025 21:42:30 +0800
Message-Id: <20251220134230.712676-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b371cc50-4b3d-4b0c-8948-6af78baac041@kernel.org>
References: <b371cc50-4b3d-4b0c-8948-6af78baac041@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACHLmrHp0ZpyzpAAQ--.32777S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw1DJF1furW5XryrArykGrg_yoWftrXE9F
	sYv39rZw15Jr43Gw13Kr13Za10kanFkrWfJw4rGFn3G34rXr4kWrsFgw4Svr1fXw4xZ3sY
	qFyvvrW8Kr1fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUU
	U==
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAUCE2lGBFfjHwABsZ
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 20 Dec 2025 11:45:10 +0100, Christophe Leroy wrote:
> Your explanation is unclear. It is correct that put_device() is the 
> correct way to drop the device reference, and it is already what 
> rio_register_mport() does. Why do you need to move it out of 
> rio_register_mport() ? This is what you have to explain.

Sorry for the unclear changelog. I think if device_register() in
rio_register_mport() fails, put_device() is already called. Then,
the error path in fsl_rio_setup() also kfree() the port. I suspected
a potential double-free issue here, although I am unsure whether this interpretation is correct.

> AI code review or human code review ?

Human review.

> Why do you remove this kfree() ? By doing this you will leak the port 
> pointer allocated earlier in the loop by kzalloc()

I just thought after device_register(), the cleanup should be done by
put_device().

I would appreciate your clarification.

Thanks,
Haoxiang Li


