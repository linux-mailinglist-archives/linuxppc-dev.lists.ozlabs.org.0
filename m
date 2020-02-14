Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C915F78D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 21:14:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K4Ng6JZJzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K1rr2jnBzDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 05:20:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J2tIAn2s; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48K1rn2tTnz8wMf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 05:20:25 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48K1rm5VHZzB49b; Sat, 15 Feb 2020 05:20:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J2tIAn2s; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48K1rk1jJPzB49V
 for <linuxppc-dev@ozlabs.org>; Sat, 15 Feb 2020 05:20:22 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 59so10004742otp.12
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Feb 2020 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UMEjP6jiAH/OYDI2ZXQY0jXirotSACylgyVCi6kzEY8=;
 b=J2tIAn2sFEFgVmijMh2KXTLon2W3H9c0p+ZBOxghX8QkfnVP2bs/y1TRnvKJLixhea
 uZPLkchMwWxq+yeE2063BV5vlXH0TSiZbWSM4ub5ofkQ4hXrYUzVjMP94t5SsmIxkLhf
 bmUMJqKQGu++t1rUMD4RiZiAmRmEcEayRCjehI0D4skOBjzkKWwIQzcFcn9q2KlKtEnU
 frZ6kk4hZ44OCSBm6C97i/K2eIafWQuQORiXEUPFDYnC16/dSO2b1Ter0y/DRTr1wqwY
 k/2ZoEWKOrk7L472CpRbKrbcoVNt/pbE3bFyMnyVQ0x7ekyFehWGd14k/SwEN0Xpcxkp
 YBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UMEjP6jiAH/OYDI2ZXQY0jXirotSACylgyVCi6kzEY8=;
 b=WqmVe6DZ8lDuBNn8jpuG3EuLr0h3fi+sp10rsHPzHlDRn8xe6ad8MhAk9C+ucwiCeP
 T97Kp8D3rzqy2AEjYzFB1x0Eyu3iHFZGAeSS+GWUajW0he7q81QoJaV3GnDBSKGFcQ+T
 K8POPHdsqV5O/nPcexGuMtXcUjNWlsRqc73PGI655aqi+ybDBzWr8j+baSr48tdJ9k5D
 uM83ojLo/Grsw26isZcunHIgzqz3542iGOlAVQqtslg3o4O4waRXM4jwjWlCLk4KaiFA
 nxI/jIQfsf53mn79XMBJYSnHj1tphBg7JZkbjsewKoLTTse6/cuoCsV97cnBJnxGcH6Y
 YuiQ==
X-Gm-Message-State: APjAAAU920rvZvvA5ImvNpgBicWtWXkQeYD277oY18GggIhVU/awsH+y
 gDRwaKP9BXf0iG2o0sjNELLacOpr
X-Google-Smtp-Source: APXvYqxd76quSEwk4MiTNJAgaPdRab19d+jjOpeiPS5qmGYhsGImXCv6B+zxu+OMhDmEQ95rtAABvg==
X-Received: by 2002:a9d:864:: with SMTP id 91mr708978oty.289.1581704418178;
 Fri, 14 Feb 2020 10:20:18 -0800 (PST)
Received: from [192.168.1.120] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id 5sm2219495otr.13.2020.02.14.10.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 10:20:17 -0800 (PST)
Subject: Re: RESEND: Re: Problem booting a PowerBook G4 Aluminum after commit
 cd08f109 with CONFIG_VMAP_STACK=y
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
 <9429f86e-8c7d-b2e6-6dc1-8f58c44baadc@c-s.fr>
 <2da19b26-9a44-2e4e-ab7d-d3fff65091bd@lwfinger.net>
 <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <8960e20a-a1bc-d47c-0d77-0b30ab8e01d4@lwfinger.net>
Date: Fri, 14 Feb 2020 12:20:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/14/20 12:24 AM, Christophe Leroy wrote:
> 
> Did you try with the patch at https://patchwork.ozlabs.org/patch/1237387/ ?

Christophe,

When I apply that patch, there is an error at

--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -301,6 +301,39 @@  MachineCheck:
  	. = 0x300
  	DO_KVM  0x300
  DataAccess:

It complains about "an attempt to move .org backwards".

Larry

