Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2B28AB88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 03:53:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8hXW53KTzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 12:53:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=MZeqM+G0; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8hVw392gzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 12:51:51 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b193so11891503pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Oct 2020 18:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=bVo49Qxmrd/VNqOY3fspHtw1vy6qQK6RQgUft1Z7OAg=;
 b=MZeqM+G0oRvw4X1i1it8vuEJDS73HJxsl2oal4RxaREoQ5Swqqn6uYW47JUXIvdkPu
 bD7cHB1SPk7XULfqfearUp7pf2O6ZaaY+sv8K6tk/M/LEXsHVb3c5VjBRG5UVpXQQFlq
 5UH8ZM2sRuTUZ6KnRtZhtb+DzxEQ8IwzZ7Wp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=bVo49Qxmrd/VNqOY3fspHtw1vy6qQK6RQgUft1Z7OAg=;
 b=QwJwtqO2+FDny3icgYoPLW/xmxqtDLkd78sKfCj5p7zD3+gLKE2kqvAPGtjbEFSMjo
 Gftjxpcyhk57oErkOqLil+usjUN+f+K9GZ7I9m0ejiONwOcq1SyMUITdsrvRu9c0DcWQ
 n4TiXgdqLLrdztNhHDDFP64ga/Lbkb1h53oL//YZMLab/9KdTqq0KUIcnJfZB0RnhXBT
 CjKzNVfEDrkNQNH5PlTywgVgVaVklZq57zncq/5sodv3HIPsRiOEGpluB8024O38TCGj
 XivPDr0yFuhsGQoe0zFd9aZz9ztAdkorRpLnmxT8h+DooXol9yLg44Wbllf5J5TaDwtT
 25Mw==
X-Gm-Message-State: AOAM530Adx6IZhvlY0hvX6kNlWLnxYrrr4uPdKj+CwLyjSO5DT/rWeUB
 n8y+zulf/XxSaMfpQr3/59IghQ==
X-Google-Smtp-Source: ABdhPJzDlI2jcqpXh8pc1IFJz5rATBl0wPOEnylkH8T6jnCZz0elMUAfQ9nLWZfZ0LSG15Wy62akaw==
X-Received: by 2002:a17:90a:f0d7:: with SMTP id
 fa23mr16580238pjb.108.1602467507550; 
 Sun, 11 Oct 2020 18:51:47 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-2428-55d4-1def-c9e5.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:2428:55d4:1def:c9e5])
 by smtp.gmail.com with ESMTPSA id k206sm20050544pfd.126.2020.10.11.18.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 18:51:46 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only
 when CPU_FTR_ARCH_31 is set
In-Reply-To: <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
 <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
Date: Mon, 12 Oct 2020 12:51:43 +1100
Message-ID: <87h7r0w6s0.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Apologies if this has come up in a previous revision.


>  	case 1:
> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +			return -1;
> +
>  		prefix_r = GET_PREFIX_R(word);
>  		ra = GET_PREFIX_RA(suffix);

The comment above analyse_instr reads in part:

 * Return value is 1 if the instruction can be emulated just by
 * updating *regs with the information in *op, -1 if we need the
 * GPRs but *regs doesn't contain the full register set, or 0
 * otherwise.

I was wondering why returning -1 if the instruction isn't supported the
right thing to do - it seemed to me that it should return 0?

I did look and see that there are other cases where the code returns -1
for an unsupported operation, e.g.:

#ifdef __powerpc64__
	case 4:
		if (!cpu_has_feature(CPU_FTR_ARCH_300))
			return -1;

		switch (word & 0x3f) {
		case 48:	/* maddhd */

That's from commit 930d6288a267 ("powerpc: sstep: Add support for
maddhd, maddhdu, maddld instructions"), but it's not explained there either

I see the same pattern in a number of commits: commit 6324320de609
("powerpc sstep: Add support for modsd, modud instructions"), commit
6c180071509a ("powerpc sstep: Add support for modsw, moduw
instructions"), commit a23987ef267a ("powerpc: sstep: Add support for
darn instruction") and a few others, all of which seem to have come
through Sandipan in February 2019. I haven't spotted any explanation for
why -1 was chosen, but I haven't checked the mailing list archives.

If -1 is OK, would it be possible to update the comment to explain why?

Kind regards,
Daniel
