Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EF515F798
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 21:19:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K4Tx4Ts4zDqgB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:19:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K1xl3T1BzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 05:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Psab2Wrc; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48K1xl1m0Pz8sxx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 05:24:43 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48K1xk48MfzB4B1; Sat, 15 Feb 2020 05:24:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Psab2Wrc; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48K1xj3TRlzB49v
 for <linuxppc-dev@ozlabs.org>; Sat, 15 Feb 2020 05:24:40 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id r27so10014120otc.8
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Feb 2020 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z0o9PTPr4V6rc2xuwJq0y+EUklSvuaeXBTIkzgGQnLU=;
 b=Psab2Wrc8zWLf0/LRmbezeql4HypqnoAn5t9fSLwbB60dNa8jdf6HiQAVu/jdzTgBp
 szGQ3L2nOU/OHaZBAwgKzCRgRS63dlnF0BhFEfqBYTOvHTn7OfhIQnKpCOZV7coVqeU4
 QyEplQy1F5oQfzjLnyj0mbqD/PmKVZjZClCItTO76p30yT0wNNi1rP+PDFXpoT0j1xYn
 2pd6YBaUUj0XIszJjXOP35djNbhtPPMEPnjXe2FNAaPRM7Mg3WCOi2Yu5NK+YOVeLG+H
 XUL+W4SH8kf8Wj3R/l7gYGzVgzgr6TjePtTr9nMx2W9SkBOkUO7ObGATmeOGlahS4Iw2
 mYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z0o9PTPr4V6rc2xuwJq0y+EUklSvuaeXBTIkzgGQnLU=;
 b=fq8h4RHMQoYV2ks/t1ckrMUsKlZS0i1qf3+oUyrSHITrqkpWUI3l32t38niMjzlReS
 Y8NBS+AbAnQdVrOdMj2UpV2uVhxIzWusGhs5lHqtWx6YIpGCuJE9K0X3J2hew6AcCU3z
 eUjbmcRIqLs3hJ35fHqUn4BJ6gk2ZTTu2NAdKPbo6VhQ/tMF9tN1hRY9QN5QuOfBVQb5
 JDAj2ByQa6+g+s0M/VcEbLftLFvb1/DtGksXBT2kc/rPwrfGZySj2LfyA/F2LdZ/6uoP
 o3sRUybm5c7vX2L7xSUUqJQ1ICxEtqGTTU3tH9vw9Is9GvCu8yNQFwETfrK06ReewQ16
 CS5Q==
X-Gm-Message-State: APjAAAWxNTPHKxlpaX2h1FSbAjE6ApL1/lDXzzqKXyGZvYT+EmOQQGLH
 YU4PauqorLV4FsoJ1d2i2aKHHUFb
X-Google-Smtp-Source: APXvYqzkaVzkrzzC2CbWfo/ab5El4EtPIT8XEZ8hSUQ5ls0PPS5oAGtFMy+u7ECc0viQjHHpxT1+qg==
X-Received: by 2002:a05:6830:15a:: with SMTP id
 j26mr3198809otp.137.1581704678809; 
 Fri, 14 Feb 2020 10:24:38 -0800 (PST)
Received: from [192.168.1.120] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id a30sm2218344otc.79.2020.02.14.10.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 10:24:38 -0800 (PST)
From: Larry Finger <Larry.Finger@lwfinger.net>
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
Message-ID: <f3f628ca-4085-e9c2-2c62-170cf9801ac2@lwfinger.net>
Date: Fri, 14 Feb 2020 12:24:37 -0600
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

When I change the 0x300 to 0x310 in two places, it builds OK. Is that OK?

Larry

