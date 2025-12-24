Return-Path: <linuxppc-dev+bounces-14994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606CCDC182
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:15:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbq6M6nhlz2yGL;
	Wed, 24 Dec 2025 22:15:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766573565;
	cv=none; b=L05Y2P2fPOwq9YqnLQKPa8ELpb7ssWbRwWIgMfUh7wU+8hnqTzZCXPG8KvTW6O2kFBchm+VV3JmZZ3Hybtf1tutc7iz+cjSPO4tmV1LsylkI47UlKVcZvKNLsKg4I9Bpt9Ifg7VqQvJZuSqfOOUCaUFpW7LpYSpPm1+UfcUPyIaQOPznsMa8MO3jceLhISUiEiWl4OoP2FaoLjpcc5IDWdGoI+g3QDuNWlBhUSqBvxxk1hRwiatApYmFZw2JKu6EHHtg1PX+FrmyD6zU6Y0YcY+CHBCnrLTmyc6RYXX6dI7KE8kfgwd8IxhyKB59mykjpMndG2ToDBeFeGr/iGN6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766573565; c=relaxed/relaxed;
	bh=ZuUZyq4ig0iykSS9GXoLrIqJhRmiTT4fa/0JWLRZ2Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mFkeDVf0rlwW065NkUgX1T8zXXFUxBIfZQ9HbVthgZBZeAMKESli1UORlnpJ+CTBBHQprQh7vcSS75ngN3e8fht41kRxjxT6bZ/LfPy+PpYQRBvUSiZMx6DKsle7J2T8Kvx4Y0TUrDXJL+iPYF2MYm00XwOJ4+jX6y9503VjikDmN4Zpda0WmJ+vk+PQYUuHF0ABS+kx/CgD5RSmNmBjRH2oAPkDwFyqeXcyEBppqD3i6D3BZYiDKINp4wUkkuLpNdX/EqZ72c11DXfCbltKqOqofzMs22yqIvThKd/VB6ZZI+/UxDphVDVmkFqFKAUIZc36oTRqrrThnmXp74qnNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbpcX2YN8z2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 21:52:43 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-03 (Coremail) with SMTP id rQCowAAnRNv4xUtpt8rTAQ--.9977S2;
	Wed, 24 Dec 2025 18:52:41 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: chleroy@kernel.org
Cc: dan.carpenter@linaro.org,
	ioana.ciornei@nxp.com,
	lihaoxiang@isrc.iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	suhui@nfschina.com
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Date: Wed, 24 Dec 2025 18:52:40 +0800
Message-Id: <20251224105240.1588158-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ad465fd1-4b5a-4fa1-b4fc-1ca7bd6fe5b4@kernel.org>
References: <ad465fd1-4b5a-4fa1-b4fc-1ca7bd6fe5b4@kernel.org>
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
X-CM-TRANSID:rQCowAAnRNv4xUtpt8rTAQ--.9977S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWDGF1rKw4kAr45ZryrWFg_yoW3Grb_ur
	yjqryavws3tw4kJayYqrsxZ3s3KFs2qrWFgrWxt3Z7tay5Z39agrWDWryayw1fKayDCFn8
	Jayqqr4xK34UWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU18sqtUUUU
	U==
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAcGE2lLmjqLQwAAsU
X-Spam-Status: No, score=0.2 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SORTED_RECIPS,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 24 Dec 2025 10:57:52 +0100, Christophe Leroy wrote:
> Ok, then this needs to be said in the commit message.

I will add it in the patch v2.

> By the way I'm a bit puzzled by the device_add() doc versus the 
> put_device(), because it looks like device_add() already calls 
> put_device() in its error path, see 
> https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/base/core.c#L3716

I think this is because device_add() increment the reference in the
beginning, see
https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/base/core.c#L3580
and if device_add() fails, another put_device() should be called to decrement
the reference which is obtained by device_initialize().

Thanks,
Haoxiang Li


