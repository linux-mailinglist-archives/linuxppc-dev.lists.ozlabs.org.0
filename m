Return-Path: <linuxppc-dev+bounces-15003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDACDC210
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqM72hWfz2yGL;
	Wed, 24 Dec 2025 22:26:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575571;
	cv=none; b=fIrGfovXSBDdM8yV8qL36kD0oXcVv2NPdIXdcpAVdsbfB/8A/4UXGNOJpYnaoYO2h2kin9QW6jn/WCjclOK08Q9l1I2wz3m5KFNn9XZwPN1PyeKvQjhxnb26CMNcfwkXz7bDeS52eKcxyeRLS0FEQUpbyL5rPEAj56l/Rh4bdxsQJQp5yuHqat+BUdSmG6VzJQT8be2QwTsIQH4RDeWWsT8RutysXFgCpzUUPbYXw/TLXqK5gmxA30krybye/NXN8MSwL6qIf0guQ8q27s0Xu0HgPUChyTkOB39fky7QvopRifMZSC4rjIPl1kjfM1JJK1weAdBp/gXIvjUSHMU+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575571; c=relaxed/relaxed;
	bh=W3hELT2kH+hdI6UF8A6afcOHvBXQmGmJaGjeyVlCcJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WU/i1YEjajxVdIpBpM11J+ShqPkrwzHFZaFJpD1cLauWoW5YmwzYPULG71ulUq5WvnNQidv8pMn/9yLMoBiHU8BVt4d5XfBsmXN3wfwFIILfW7ekm4/w1T/MHLuWr3d/ixQ3y481J7sHCWEndUhFsR0EIcT79/TnPgHszekV5LTV9LH7FbKJFxNTEQrsy/xA28RfC1q7R2qXNVdN+gEvf8rIwUUMYwvJlE1oz4lNql7nicAGtDbt9rCw7bk1FekJmfssnlAEBhcxefrC2AyOpEnMT8DpRCOuDxuNGE8fRPPJie61IHtjxoVUx302PYGxy4djSwN6v30Buyie8hC0Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqM60p6mz2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:26:09 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-05 (Coremail) with SMTP id zQCowAC3SQ3JzUtpVcfGAQ--.27574S2;
	Wed, 24 Dec 2025 19:26:01 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: chleroy@kernel.org
Cc: dan.carpenter@linaro.org,
	ioana.ciornei@nxp.com,
	lihaoxiang@isrc.iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	suhui@nfschina.com
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Date: Wed, 24 Dec 2025 19:26:00 +0800
Message-Id: <20251224112600.1592218-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b7f7e968-a683-4e1e-8ccc-5dd19f0f15c5@kernel.org>
References: <b7f7e968-a683-4e1e-8ccc-5dd19f0f15c5@kernel.org>
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
X-CM-TRANSID:zQCowAC3SQ3JzUtpVcfGAQ--.27574S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW8tF4DXFWxKry8ur4UJwb_yoWDGrg_Cr
	45tr47Xw4kAr4Utw47KrnayryYga12qrZ3XrZ2qFWxJ345Z3y5Z3ykXF95Aw15X34IkrZ8
	J3W2vF1rAr4DWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAYGE2lLmjqb9gAAsw
X-Spam-Status: No, score=0.2 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SORTED_RECIPS,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 24 Dec 2025 12:07:22 +0100, Christophe Leroy wrote:
> Ah yes, I see.
> 
> But then all exit paths in fsl_mc_device_add() after device_initialize() 
> should call put_device() ?

> Then in fact the fix should instead be the following, shouldn't it ?

> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c 
> b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 25845c04e562..6d132144ce25 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -905,11 +905,7 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
>   	return 0;
> 
>   error_cleanup_dev:
> -	kfree(mc_dev->regions);
> -	if (mc_bus)
> -		kfree(mc_bus);
> -	else
> -		kfree(mc_dev);
> +	put_device(&mc_dev->dev);
> 
>   	return error;
>   }

Yes, I think so.
However, I submit a same fix months ago and got a reply:
https://lore.kernel.org/all/2025052622-nautical-suitably-486c@gregkh/

I didn't figure out why, and look forward to experts' guidance.

Thanks,
Haoxiang Li


