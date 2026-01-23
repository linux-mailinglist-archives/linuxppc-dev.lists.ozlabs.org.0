Return-Path: <linuxppc-dev+bounces-16251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO3iKn/Uc2kCywAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:05:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F687A775
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:05:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyTSD0lnQz2xdY;
	Sat, 24 Jan 2026 07:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769198715;
	cv=none; b=Pwyet/1hd+rJeyEnB6PP0U6tx8JXBkH1eMNsZF+T7px8bwNkvBRqnghSda/VsWowSBbEQ5r0rwZ5cqyYCywBe0uX7yK+LjBtj2l1X7DhsGxPDAXfQEOmuNDioC7HMJ7PxofACJvqgpK/Ut9HUmDqGV3ejfD0pIuYDnb1IkSybqsLMPBF9JRVG96ZoBgenRLXeelEJvQmJXP6glYWB5kCyUkj411flK0rpwqPypt7F62oPp8bzWz3/o6s3X4+pcEH0Ax76hPOJ/KPd+9Zg3nRF5A0+nQwyaKxmNiTgiXc7zLWAc15o6gC9Uyn4wT1Jay37jEywKZTE1r+uCkeic/DdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769198715; c=relaxed/relaxed;
	bh=hIt6EEVJiM9z9X9gOZcQSzWn9uWNq168RPZOsi0gMBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHSGQ+YO1Me0V+oUwHOLbCT0Jk63awfOBn9hry6nI4Ke9mc2uAfO3UfMqie0VWwI9PfLcxe/Evn/+Q6W9R95VVGVOb91ZC0w3hDsT6QWLypQuaY+e8PhZZ0klYWyKoA4iUris+/p2GPuZDfKULW+Bi4A4CaWkK+ENvBtbDv7VqoZOmI2fQM28hHcNNlKvsWE539QyIkEZuO4TELYJ2TzptCVvWY964qGyUaX8xVT+4HkoyRbrThLYxHYY6daWeA8FGblazP5siMNPQLkEpOZTXzs/P+M8Q+BuPjGTDo4BZSG6aOvtQbUAuTukzGbRcQzMffaH372GLOI5SSli9+VjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a0BGTOCd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=sohammetha01@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a0BGTOCd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=sohammetha01@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyTSB6pmWz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 07:05:14 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a7d98c1879so13313075ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198711; x=1769803511; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIt6EEVJiM9z9X9gOZcQSzWn9uWNq168RPZOsi0gMBo=;
        b=a0BGTOCdgZL5VeNv+yBbfSuhN9EK10VTWu5BvQqKRj+MpBTnnk5PTiWMQU7BetsbLR
         fXLTaeqT9+rvnRemxCxODYLdZfe/y1q+NZakYtvWoY5jGQhcagX+odffIXNmwJc7LQLi
         6nbGmKdtbvvG3EzJuyzlmzg10rhJ1rNUVqyx59R1gecDoU0yPqOjxdNTsm6KHsvvbtAt
         RqvkrUqADpocG6ZvcAjYtvX+DisSOEVssz2pOxZTgO2LrvK3E55jw8HKOvMozwTR1P8C
         SSNicBHvgXKzjFxUl2Y8almNj8T8LUZVetfdgUIlXegtPXPrFkAosLdlsiwf7dTmQLYP
         0lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198711; x=1769803511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIt6EEVJiM9z9X9gOZcQSzWn9uWNq168RPZOsi0gMBo=;
        b=KnIPpWPqjpb8bEpXMoBsxzZRTnP1p2I6tqzZSkLadVcuZLEuzJeulyZvMBisNYkGgR
         7T/HHyup5BSjoQa2GltHW7VTB+2gPKbklFBBTitAvFYjXlcVBkwAnfSvpTPplt/t8Hnk
         Pm4q7bNvzM8Icl9DyAU3B04k/N57+qiQmefNP4I/9vdEVk6e/xxe3dolIIGozAd6VOMC
         m5CnUuwefVgb9Uv72c08ywKfAtKrGj7VBNqdDCnd6zgTMDHjRYJhqLtIpIjvvjfsDo69
         YzgI/L2E6wo1i5+8VFrQ5hO/D25y9OuX/8bNakGzoUT8md5w0ym2eEWWqNTT4/cEWvWo
         yVsw==
X-Forwarded-Encrypted: i=1; AJvYcCU3nPnm73tNZAMtDTfADyHZw+iMsBfxf9SKuRXOK4Qkc2ZQhnazta5G09WQ+oj/GaLdd004fQVudYV2v38=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEcXYPYNpScrsbtJ1ttWkLLTWJAZ+2551s2xx6VercwCbILa9O
	9c9g48irFxbuUmFb9LJpmI11V0f7Plyn0wYOgiLSOYXjPxnnm1yMkgZl
X-Gm-Gg: AZuq6aIyLFkzbbXSfS6XXiEvEERqWqm/IwA6rxJvvisrkZCR1OT8WL96nP3obRTewX7
	la1YDDm9+mtIy8dwgDjEWSDSmqgp0xgwIZzWgWjoW13qyWkN+NqBdg08RiuXBqR3WSH1r98hPsD
	iGv0TAgbOclRfauSZUxcXznRuD4R+nMV39IJ4QUkpCue+BeP4D4vd9iK+yupl0xP9wc+Ft6fubZ
	sKlsy4sOtUG5HDAzWpVxKH4PuuQpALgO0R1lWnwyUWMGAk8OQDrUlf93PHmP68EROSAFAp3BG5Z
	Waq2AvAiCnxss/t1dku/NKcJ8guYLFoRvjcf8V+DuE5PxU4O+iUPHJbW9TYwHvyD9m8UoVSuvCM
	VC3VQBnFCond6cOKYeL/WavOL01l/SCWbYYqek6PySk8os7wkxk0qIz3dXuKoqKZCAxo6o6JpaN
	401CbGkP658DDqO+hVk1rgjSi5EoTKhw==
X-Received: by 2002:a17:902:db09:b0:298:4718:909f with SMTP id d9443c01a7336-2a7fe757006mr32714695ad.51.1769198710484;
        Fri, 23 Jan 2026 12:05:10 -0800 (PST)
Received: from [192.168.7.12] ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f98583sm27149525ad.54.2026.01.23.12.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 12:05:09 -0800 (PST)
Message-ID: <f659ce0d-951f-406f-bdb4-29f23a30d851@gmail.com>
Date: Sat, 24 Jan 2026 01:35:03 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mpic: Fix dead link to fsl/mpic.txt
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>,
 Thorsten Blum <thorsten.blum@linux.dev>, linuxppc-dev@lists.ozlabs.org
References: <20251203191706.58901-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <20251203191706.58901-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16251-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sohammetha01@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,linutronix.de,marliere.net,linux.dev,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel-mentees@lists.linuxfoundation.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:tglx@linutronix.de,m:jirislaby@kernel.org,m:ricardo@marliere.net,m:thorsten.blum@linux.dev,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sohammetha01@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B2F687A775
X-Rspamd-Action: no action



On 04/12/25 00:47, Soham Metha wrote:
> Update the reference to the old 'fsl/mpic.txt' binding, which was removed in
> commit 326d25198112 ("dt-bindings: powerpc: Drop duplicate fsl/mpic.txt").
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
> 
>  arch/powerpc/sysdev/mpic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index ad7310bba00b..b6c7b7dc1622 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -1105,7 +1105,7 @@ static int mpic_host_xlate(struct irq_domain *h, struct device_node *ct,
>  		 * First two cells are as usual.  Third specifies
>  		 * an "interrupt type".  Fourth is type-specific data.
>  		 *
> -		 * See Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
> +		 * See Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
>  		 */
>  		switch (intspec[2]) {
>  		case 0:

Hi,

Just a gentle ping on this documentation patch in case it was missed.
Please let me know if any changes are needed.

Thanks,
Soham

