Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDE14CDF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:09:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4877hb1rL0zDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 03:09:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ascii.art.br (client-ip=23.83.209.45;
 helo=crocodile.birch.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ascii.art.br
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha1
 header.s=ascii.art.br header.b=jkWI+bAc; 
 dkim-atps=neutral
X-Greylist: delayed 920 seconds by postgrey-1.36 at bilbo;
 Thu, 30 Jan 2020 03:07:22 AEDT
Received: from crocodile.birch.relay.mailchannels.net
 (crocodile.birch.relay.mailchannels.net [23.83.209.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4877ff6cQszDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 03:07:20 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 5CE2D581604;
 Wed, 29 Jan 2020 15:51:56 +0000 (UTC)
Received: from pdx1-sub0-mail-a97.g.dreamhost.com
 (100-96-8-113.trex.outbound.svc.cluster.local [100.96.8.113])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 0C9DB5816F6;
 Wed, 29 Jan 2020 15:51:55 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from pdx1-sub0-mail-a97.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.5); Wed, 29 Jan 2020 15:51:55 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Inform-Hook: 3c633eae4f9ee326_1580313115492_3723001508
X-MC-Loop-Signature: 1580313115492:3061292462
X-MC-Ingress-Time: 1580313115492
Received: from pdx1-sub0-mail-a97.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a97.g.dreamhost.com (Postfix) with ESMTP id B609D7FF9E;
 Wed, 29 Jan 2020 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=ascii.art.br; h=from:to:cc
 :subject:in-reply-to:references:date:message-id:mime-version
 :content-type; s=ascii.art.br; bh=zeqxp4o5sFQX6xdE3CoUJ+kq22o=; b=
 jkWI+bAc8kwiTsmUTUUEUDdPRWafZiTv2y68R7D0LBDh+su0xjfu5GXB4bN3zS/Q
 DwwpprCQGUiWB8niOjDX5vM82P8bSuiDzTTL1hfYWJ7gi/iCLLWFXW+LmP7B2JIT
 y1jwM8Toxf/LA8KiRoPE1EisuSwnsCWzsDx8zascObk=
Received: from ascii.art.br (unknown [187.74.77.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: tuliom@ascii.art.br)
 by pdx1-sub0-mail-a97.g.dreamhost.com (Postfix) with ESMTPSA id 1FDE17FFAA;
 Wed, 29 Jan 2020 07:51:47 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a97
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: Nicholas Piggin <npiggin@gmail.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 linuxppc-dev@lists.ozlabs.org,
 Libc-alpha Mailing List <libc-alpha@sourceware.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
In-Reply-To: <1580273424.ea818exa2c.astroid@bobo.none>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <cd9e4b28-d577-8850-7c2b-a488fcb4740d@linaro.org>
 <1580273424.ea818exa2c.astroid@bobo.none>
User-Agent: Notmuch/0.29.1 (http://notmuchmail.org) Emacs/26.3
 (x86_64-redhat-linux-gnu)
Date: Wed, 29 Jan 2020 12:51:44 -0300
Message-ID: <874kwe8dm7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -100
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffujghffgffkfggtgesthdtredttdertdenucfhrhhomhepvfhulhhiohcuofgrghhnohcusfhuihhtvghsucforggthhgrughoucfhihhlhhhouceothhulhhiohhmsegrshgtihhirdgrrhhtrdgsrheqnecukfhppedukeejrdejgedrjeejrdelvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopegrshgtihhirdgrrhhtrdgsrhdpihhnvghtpedukeejrdejgedrjeejrdelvddprhgvthhurhhnqdhprghthhepvfhulhhiohcuofgrghhnohcusfhuihhtvghsucforggthhgrughoucfhihhlhhhouceothhulhhiohhmsegrshgtihhirdgrrhhtrdgsrheqpdhmrghilhhfrhhomhepthhulhhiohhmsegrshgtihhirdgrrhhtrdgsrhdpnhhrtghpthhtoheplhhisggtqdgrlhhphhgrsehsohhurhgtvgifrghrvgdrohhrgh
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Adhemerval Zanella's on January 29, 2020 3:26 am:
>> 
>> We already had to push a similar hack where glibc used to abort transactions
>> prior syscalls to avoid some side-effects on kernel (commit 56cf2763819d2f).
>> It was eventually removed from syscall handling by f0458cf4f9ff3d870, where
>> we only enable TLE if kernel suppors PPC_FEATURE2_HTM_NOSC.
>> 
>> The transaction syscall abort used to read a variable directly from TCB,
>> so this could be an option. I would expect that we could optimize it where
>> if glibc is building against a recent kernel and compiler is building
>> for a ISA 3.0+ cpu we could remove the 'sc' code.
>> 
>
> We would just have to be careful of running on ISA 3.0 CPUs on older
> kernels which do not support scv.

Can we assume that, if a syscall is available through sc it's also available
in scv 0?

Because if that's true, I believe your suggestion to interpret PPC_FEATURE2_SCV
as scv 0 support would be helpful to provide this support via IFUNC even
when glibc is built using --with-cpu=power8, which is the most common scenario
in ppc64le.

In that scenario, it seems new HWCAP bits for new vectors wouldn't be too
frequent, which was the only downside of this proposal.

-- 
Tulio Magno
