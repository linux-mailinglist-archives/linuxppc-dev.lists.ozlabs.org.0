Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C727325A99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:13:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmqrS0lD8z3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 11:13:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=GcVsIpJV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=GcVsIpJV; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmqr25B88z3ckj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 11:13:22 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id h4so4967504pgf.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 16:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ZivvhrfkhhTWgDzztV555oz39QyHO/aocKYbYWUQe7c=;
 b=GcVsIpJVP5u/5w80wL2UwMySRE7mEBVLTwA0+ZZ7ukBTrE009ilC45Rk6loPOTKlZV
 TS+QR7vD0BzKnTn1iKwG/a1Ll+35EB4y+6YaLhdjc9YRiWepIUfTcotFKII3aLCRa/RP
 sa56YB7OLx7ooX5I3Ynfks6Y0fIRGln/GGVVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZivvhrfkhhTWgDzztV555oz39QyHO/aocKYbYWUQe7c=;
 b=KmnLU+KxmNGsfS4FYWqblGdm/2HcHKl3ybulDL8cZEApQ8N4zNbPtexe8LsEVEoT1V
 27oPOkkr59SCLoX06DQsW884xROKh/JcgRHRHSBOUIDH9S9wfJQoVa9YCAK2ZZffQMK+
 ZCsrxHXUEH4ey2gSMWSQ5215+V9KIMrP+10tBrFbcVXBn2Fk0hmXa/408CjaKvva8DFj
 Yz51KtEqILEHZzCwwab4mMfmvc/Ie1p+KOtEw1kCJV0nTp/ZjBisiHZryVuZ96nT9tX8
 bJWRHZRBcJo0evg1jO4fiRSjFgDeZRRE/p+DsCQstKaXV9HPCE/EaVpgOWsvp/tewhjv
 2cMA==
X-Gm-Message-State: AOAM531Qanqij3Nq0D9BXFVbiCMsWrBByY2Fmc+eUy8u4uXoaJSscF5c
 TF+/DbVhmmsi8P3dFeQApPlsQ1+4oTu1Pg==
X-Google-Smtp-Source: ABdhPJx+BGkCoBCrAyA+ITdrqUbo2TGq9sBabUMjUB1dggwlD4tubWfnluZS5eURVlAenCquybMUQA==
X-Received: by 2002:a63:4753:: with SMTP id w19mr414286pgk.394.1614298398442; 
 Thu, 25 Feb 2021 16:13:18 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-0af1-7e55-275a-1dc8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:af1:7e55:275a:1dc8])
 by smtp.gmail.com with ESMTPSA id ml17sm8311967pjb.45.2021.02.25.16.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 16:13:18 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH 5/8] poweprc/lib/quad: Provide macros for lq/stq
In-Reply-To: <20210225154444.GF28121@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-6-dja@axtens.net>
 <20210225154444.GF28121@gate.crashing.org>
Date: Fri, 26 Feb 2021 11:13:15 +1100
Message-ID: <87r1l3ofdw.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvmlinux@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> On Thu, Feb 25, 2021 at 02:10:03PM +1100, Daniel Axtens wrote:
>> +#define PPC_RAW_LQ(t, a, dq)		(0xe0000000 | ___PPC_RT(t) | ___PPC_RA(a) | (((dq) & 0xfff) << 3))
>
> Please keep the operand order the same as for the assembler insns?  So
> t,dq,a here.
>
> It should be  ((dq) & 0x0fff) << 4)  .
>
>> +#define PPC_RAW_STQ(t, a, ds)		(0xf8000002 | ___PPC_RT(t) | ___PPC_RA(a) | (((ds) & 0xfff) << 3))
>
> And t,ds,a here.  (But it should use "s" instead of "t" preferably, and
> use ___PPC_RS, because it is a source field, not a target).
>
> It should be  ((ds) & 0x3fff) << 2)  as well.
>

Ah, thank you. I'll fix this up.

Kind regards,
Daniel

>
> Segher
