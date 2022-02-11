Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBF4B1ED2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw45z3DXfz3c9t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:51:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=u6CWiWlQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F3J/kxua;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=u6CWiWlQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=F3J/kxua; 
 dkim-atps=neutral
X-Greylist: delayed 395 seconds by postgrey-1.36 at boromir;
 Fri, 11 Feb 2022 17:50:54 AEDT
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw45B6L9Dz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 17:50:54 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 56D802B00220;
 Fri, 11 Feb 2022 01:44:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 01:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=HvFmbhxULQy7Wi
 D8a5AA4taYB4vhUTCo5A74bweqwIY=; b=u6CWiWlQbrFWW3U8wZCMxDJ/ZOcxz5
 IJO5Vc3n7ZBnv+uN+YGTjbb3qwOc3dIL7R7vGVabuql2eiUu/jG2tSwf6ZSS+QC4
 8Q7dfUadHrgCaeGJVUWPKZe5mpTY0K+LJ4EDo8vHTUoti6dpbgfDw7l/rH37/z+G
 faHWrix70mDxKbrlCJ/VJSsq3hbkSnJSlDBBkhI1YKnjOQdmWJUtbpNocWhBac/r
 EY2x2Fhxzhc05KEmVctie+cA82qHrVN/kwh0gU38OcIcMjc6Kfpfh/NnXlv17+rx
 KK7sB3Rwd2FnxO9kst2AxT96YHF3JziKzzGRGtBRhXAD4uXpiB3NnD9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=HvFmbhxULQy7WiD8a5AA4taYB4vhUTCo5A74bweqw
 IY=; b=F3J/kxuagKhW77qG+7hwISPLYDxBw017oI2NMaDt+MGBSscOTiX9Us6Xp
 uz9VOPeOhuqJptCn6HXujGN5qd038UJf6116/i4t9gSR0bJ0gybm8MbsY/JS9nlA
 2wfwV50bJg6K2Ptzy+q754LKZVUIzXw5VUgnLyR96pWWVWw9TP46HUrDPHqKBpCe
 QuxaBiA8DBqLT4EQBRPdrmbVCE99+8yfJMVCpW+JYWhzljCp1KfxUoqotXCw7xnj
 v6QZh0SR+wr2uHAxezsa+IENolaObQA7i32q298/8tDNala8U/0Ka75ol9d3y0qD
 D6gwHD1AFVfdgyBomd0b9P4ic87JQ==
X-ME-Sender: <xms:vQUGYnKGInObE8cDZQoG7UuSQyE2q7W0eYDZE8tuz-B-PYYPcDWPBQ>
 <xme:vQUGYrLGix-4R8rSycyv4kWqgRuQ36Sr44OcW1kSjOIAAymIU0hS9FaeMY2kBPRti
 FEWwPLXFXNVhIiPhA>
X-ME-Received: <xmr:vQUGYvvdf4Kn41LV6bgSPufyIfK0TIzsy2T087QIsdxvEp7G4swR9TMyUEucGvKSWBc0BDOZ4FXrWBtIIUKtMYGVjrfrNNmps_Q9eq9lGDpxBE_fO1GT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedvgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvjghftgffgggfgfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepvdevvddvtedtueeiueekgeetkeejtdeu
 hfehhfejgfdvvedtleefteekhfduvddtnecuffhomhgrihhnpeeigedrshgsnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehr
 uhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:vQUGYgZyKAStTzCvHkM840mjSHoRuKmBnqnW8f_xBN_OG9-a-JP_MA>
 <xmx:vQUGYua0damM9LLXir-Za4dc6ai74t6sDVLbaOvjHKSCCE1FQUsZuw>
 <xmx:vQUGYkBGk6A5w75urxGVSM63zfqD94e0WyyEbS9BfXZOkGT3kgQkSA>
 <xmx:vQUGYkkg9mYdvf-aDcJKx9d5bpmTV5vWfSy2tQAk1djs_OTvhdUQJ5eSmWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 01:44:09 -0500 (EST)
Message-ID: <62e5a57c18557a20db8e60b3995a549cde622cdb.camel@russell.cc>
Subject: Re: [PATCH kernel 3/3] powerpc/llvm/lto: Workaround conditional
 branches in FTR_SECTION_ELSE
From: Russell Currey <ruscur@russell.cc>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev
In-Reply-To: <20220211023125.1790960-4-aik@ozlabs.ru>
References: <20220211023125.1790960-1-aik@ozlabs.ru>
 <20220211023125.1790960-4-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2022 16:44:04 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.3 
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-02-11 at 13:31 +1100, Alexey Kardashevskiy wrote:
> diff --git a/arch/powerpc/lib/memcpy_64.S
> b/arch/powerpc/lib/memcpy_64.S
> index 016c91e958d8..286c7e2d0883 100644
> --- a/arch/powerpc/lib/memcpy_64.S
> +++ b/arch/powerpc/lib/memcpy_64.S
> @@ -50,10 +50,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
>     At the time of writing the only CPU that has this combination of
> bits
>     set is Power6. */
>  test_feature = (SELFTEST_CASE == 1)
> +       beq      .ldst_aligned

Hey Alexey, typo here (should be .Ldst_aligned) that breaks the build
for BE.

>  BEGIN_FTR_SECTION
>         nop


