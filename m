Return-Path: <linuxppc-dev+bounces-16742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F9uLFPgiWnGCwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 14:25:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A6310FA53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 14:25:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8lnC1CX7z2yGx;
	Tue, 10 Feb 2026 00:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770643535;
	cv=none; b=jE0nqFQuGRhA1DMopOA4nzSs9sdWiSUAInuOUxuFXMESsWL7bvSb6DVKXfanTb2Gf5GKeMPLRB6c6TGFHzvca+H2EY0EREk5t7HerUzOGV+bkV13mJwXA9L4sFbmC19kjte3d/MZdTd3uxE+z9g1QOiWFeVeycQCr01nkIGgaYsxW1Lfde1sMDlqqLykg/avoBEE9MSnnP5JS0sJXIZ7BUBWzezzYg58BQBzvw30EusS3+gDul1GvI4fZceHXX3WNUl290ll8o7f62uSJQLrMLBAE4RvwPwqHCS2AZ0JLr4e9uJMrdOByVZHPY8A5VqEljjQmuu++HIfYIA7H4q4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770643535; c=relaxed/relaxed;
	bh=JP4IbHsF/5YAbH5J94xCvyClExqMVG02cDoNWQwvPBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lhHeXyNIZ8ZzUDCaC5go3/ZrpYKSPs4TsSekn2+9K13puUGk1FabUuIRfqmqgHTW9TGxfigSqPWkjOPWjwmFlHX5XqfrTYOzDTmnskrWokJXmSvez1U2CTYEhnYmQ01YDmKjaD0QfhDSbgXWEjn17YSe2+z2zmTr7/P4JBJSKGkGBnuo0g1erH30R8YXLnNgeD8jT0JjlZjQDlUs7tOvpvjWdwdC9mwfT65hsZgO/VIM8qU3Mfp+c1mgrdxwY4yFoIA30+fvPQt27Y7xOj998jT0PI4MX33GNXh2j+TvbjEyFNK8P2v9sWxgXoWPK6l1STYMcbq9dGHL97ZvhEDFVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FLZEIi8w; dkim-atps=neutral; spf=pass (client-ip=113.46.200.216; helo=canpmsgout01.his.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=FLZEIi8w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.216; helo=canpmsgout01.his.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8ln53Myjz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 00:25:26 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JP4IbHsF/5YAbH5J94xCvyClExqMVG02cDoNWQwvPBQ=;
	b=FLZEIi8wDbq1RCgJ/4jdPYnzhY5Y09gbuel1W6qKZ8xZWUlTu8O9yb6QHzPK4lA6JKobB2+9n
	5ehZ+TITYJNmAH2ho7wCxuB92k7OX/Z++k7k+KxHhpi2gbsIwy/AgGTR6w5tzv7YoeduelL7Da+
	CYmv34HS43pkBShRogReoHw=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f8lgd3BGyz1T4GQ;
	Mon,  9 Feb 2026 21:20:45 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 170CC4056A;
	Mon,  9 Feb 2026 21:25:15 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 9 Feb 2026 21:25:14 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <chleroy@kernel.org>, <andriy.shevchenko@intel.com>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<kees@kernel.org>, <andy@kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, <lilinjie8@huawei.com>,
	<liaohua4@huawei.com>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 2/2] powerpc/text-patching: Fix possible stringop-overread compilation error
Date: Mon, 9 Feb 2026 21:25:01 +0800
Message-ID: <20260209132510.84205-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <bca0abe3-5b8d-4493-a338-b41322e9e85d@kernel.org>
References: <bca0abe3-5b8d-4493-a338-b41322e9e85d@kernel.org>
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
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linux.ibm.com,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-16742-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:andriy.shevchenko@intel.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:kees@kernel.org,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,m:xieyuanbin1@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim]
X-Rspamd-Queue-Id: 23A6310FA53
X-Rspamd-Action: no action

On Fri, 6 Feb 2026 20:53:55 +0100, Christophe Leroy (CS GROUP) wrote:
> Le 06/02/2026 à 19:26, Kees Cook a écrit :
>>
>> Isn't it possible to do this and not need __compiletime_strlen at all?
>>
>> 	n_len = strnlen(name, min(__member_size(name), KSYM_NAME_LEN));
>
> ppc_kallsyms_lookup_name() only has two callers and they call it with a
> built-in string. I think we can do something a lot simpler, something
> like (untested):
>
> static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
> {
> 	unsigned long addr = kallsyms_lookup_name(name);
>
> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
> 		addr = ppc_function_entry((void *)addr);
>
> 	return addr;
> }
>
> #ifdef CONFIG_PPC64_ELF_ABI_V1
> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name("." ## x);
> #else
> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name(x)
> #endif
>
> Christophe

When CONFIG_PPC64_ELF_ABI_V1=y, it seems that the try of lookupinp
the original non-dot symbol is missing.

What about this (Only the compilation test is performed):
```c
static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
{
	unsigned long addr = kallsyms_lookup_name(name);

	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
		addr = ppc_function_entry((void *)addr);

	return addr;
}

#define ppc_kallsyms_lookup_name(x) ({					\
		unsigned long addr = 0;					\
		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))		\
			addr = __ppc_kallsyms_lookup_name("." x);	\
		if (!addr)						\
			addr = __ppc_kallsyms_lookup_name(x);		\
		addr;							\
	})
```

