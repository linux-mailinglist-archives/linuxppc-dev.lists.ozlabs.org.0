Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC391A73A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 15:01:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=KUmBRGdI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Id5amWiO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8zGH0QLvz3cYT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 23:01:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=KUmBRGdI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Id5amWiO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.154; helo=fhigh3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8zFS1Lf2z3cTj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 23:00:27 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 690011140297;
	Thu, 27 Jun 2024 09:00:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 27 Jun 2024 09:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719493225; x=1719579625; bh=SaPRVN9+Aj
	gKYt7eKG84QyPDe0b8SyRoJDobeWJkzD8=; b=KUmBRGdIUf5FWf7rQXCmh7UHb8
	iWaNMubHRVwhjcJ6jdNkq5OXjuKH9rHOsL1aS8A5sttLGDMIsmha3zr58XJY6XTU
	Oyel/FgZYQcddBNZ0/eJk4xbrhL0xiEROWbKANigGKyAzWAVhqpHA4SoETJxXrhM
	n2ea3NKDk2ChSj87houXAh9dQMwk6M0WLY6VwTr0q38ZD9NKd9Y4cxE01SeL+p6w
	fO5MicY21BFRxhMAvUhFWN8N3b0Ji5Tc8VCBau8hQ0Y78vMqZLLEL195NQ5f3j15
	mKpObT/xfDU+NVHR7j9lkQJjSojtbnDftSPXNSfVEyvhiWvvBg5iGtvUxByg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719493225; x=1719579625; bh=SaPRVN9+AjgKYt7eKG84QyPDe0b8
	SyRoJDobeWJkzD8=; b=Id5amWiO2NMu6jmK6d2q/dqQpdqYpWoqufPq03NVdbOU
	BDPRxQbgjmmP5zgJkfcjVRUMtkduBZvJHwzp4mgo7FO0s9OLetP2MrvbwOYhvu4T
	5P/t8G0r/v2513+x7WbHqpsAhVsAOT5B2V5Mp7+fiPy/XXr3SbYHTRlAR1LVH7Wm
	Kj0uLqROh+eNxBLg2NCeTGqtLTMc1Q0lnGFFtmOimxQP+iO5PbGOhR2w0wFlbdv8
	zHdPOdPCUdYwmAavm740u99rAr+xP5ucHMrm0D0XI3346j9JDnDk3pRtJa4LuUvi
	f1fcuI5J+63rAsBXBB1ZFGwv97dZnGceCv6k0LHr5w==
X-ME-Sender: <xms:aGJ9Zi25TQuX60_VBE7ZI4q668YF8j1n1g7q4xgM7B1YYdnO9BAwTQ>
    <xme:aGJ9ZlFi6Kf1mO_nsrFmKhftPv_ARWvxu0Exr8KKCy29XOO4RaqcjkSLOOJFb9s3T
    HnGjgfTGIDi0MG7dAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdeggdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:aGJ9Zq76Uh6G7-1I_v2ml3O4i1ywzI-ybbwYIkJYjQlsl3ZnwG2veQ>
    <xmx:aGJ9Zj182Led8KhFNtMbskBJrcDcSmRwwfKXhQrzJY511MbT-IWHrA>
    <xmx:aGJ9ZlF4S3FNFHWCj29csO2BHcwTFAXrpyEqTViQlT47THKR7MyIBQ>
    <xmx:aGJ9Zs-czbSwgPjVkLhDw3jsFoNphnhWfx3F52xniYsupN-5qzSAaQ>
    <xmx:aWJ9ZtH_QhmLwrWyEW7v4Khlb1B7f_Ewk3Z22-FSv0vu9ygkUTXPitli>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 176F5B6008D; Thu, 27 Jun 2024 09:00:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <3732da73-ecad-4415-bfa7-0f9ad6b2a58e@app.fastmail.com>
In-Reply-To:  <CA+G9fYtiWKuQzwoBVaBA6zp304uCw5SsHKf3484CY-kuuOgnFA@mail.gmail.com>
References:  <CA+G9fYtiWKuQzwoBVaBA6zp304uCw5SsHKf3484CY-kuuOgnFA@mail.gmail.com>
Date: Thu, 27 Jun 2024 15:00:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm <linux-mm@kvack.org>,
 lkft-triage@lists.linaro.org,
 "Linux Regressions" <regressions@lists.linux.dev>
Subject: Re: powerpc: nvram_64.c:75:13: error: 'oops_to_nvram' used but never defined
 [-Werror]
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Anders Roxell <anders.roxell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024, at 14:49, Naresh Kamboju wrote:
> The powerpc builds failed on Linux next-20240626 tag due to following 
> ----
> arch/powerpc/kernel/nvram_64.c:79:17: error: initialization of 'void
> (*)(struct kmsg_dumper *, enum kmsg_dump_reason,  const char *)' from
> incompatible pointer type 'void (*)(struct kmsg_dumper *, enum
> kmsg_dump_reason)' [-Werror=incompatible-pointer-types]
>    79 |         .dump = oops_to_nvram
>       |                 ^~~~~~~~~~~~~
> arch/powerpc/kernel/nvram_64.c:79:17: note: (near initialization for
> 'nvram_kmsg_dumper.dump')
> arch/powerpc/kernel/nvram_64.c:645:13: error: conflicting types for
> 'oops_to_nvram'; have 'void(struct kmsg_dumper *, enum
> kmsg_dump_reason,  const char *)'
>   645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
>       |             ^~~~~~~~~~~~~
> arch/powerpc/kernel/nvram_64.c:75:13: note: previous declaration of
> 'oops_to_nvram' with type 'void(struct kmsg_dumper *, enum
> kmsg_dump_reason)'
>    75 | static void oops_to_nvram(struct kmsg_dumper *dumper,
>       |             ^~~~~~~~~~~~~
> arch/powerpc/kernel/nvram_64.c:75:13: error: 'oops_to_nvram' used but
> never defined [-Werror]
> arch/powerpc/kernel/nvram_64.c:645:13: error: 'oops_to_nvram' defined
> but not used [-Werror=unused-function]
>   645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
>       |             ^~~~~~~~~~~~~
> cc1: all warnings being treated as error

The problem is the forward declaration that was not changed
as part of commit 7e72bb7504d1 ("printk: add a short
description string to kmsg_dump()"). This should fix it:

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index e385d3164648..a9da83c4243a 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -73,7 +73,8 @@ static const char *nvram_os_partitions[] = {
 };
 
 static void oops_to_nvram(struct kmsg_dumper *dumper,
-			  enum kmsg_dump_reason reason);
+			  enum kmsg_dump_reason reason,
+			  const char *desc);
 
 static struct kmsg_dumper nvram_kmsg_dumper = {
 	.dump = oops_to_nvram


      Arnd
