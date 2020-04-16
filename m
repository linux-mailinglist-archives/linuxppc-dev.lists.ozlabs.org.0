Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A95741AD104
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:20:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939Zq6sCxzDsNT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:20:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deneb.enyo.de (client-ip=37.24.231.21; helo=albireo.enyo.de;
 envelope-from=fw@deneb.enyo.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=deneb.enyo.de
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939XP4qvGzDrPB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 06:18:28 +1000 (AEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jPAxm-0006kd-Sh; Thu, 16 Apr 2020 20:18:18 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jPAxm-0005WN-Nn; Thu, 16 Apr 2020 22:18:18 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416004843.GO11469@brightrain.aerifal.cx>
 <1587002854.f0slo0111r.astroid@bobo.none>
 <20200416023542.GP11469@brightrain.aerifal.cx>
 <1587004907.ioxh0bxsln.astroid@bobo.none>
Date: Thu, 16 Apr 2020 22:18:18 +0200
In-Reply-To: <1587004907.ioxh0bxsln.astroid@bobo.none> (Nicholas Piggin via
 Libc-alpha's message of "Thu, 16 Apr 2020 12:53:31 +1000")
Message-ID: <87wo6fchh1.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: libc-dev@lists.llvm.org, Rich Felker <dalias@libc.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin via Libc-alpha:

> We may or may not be getting a new ABI that will use instructions not=20
> supported by old processors.
>
> https://sourceware.org/legacy-ml/binutils/2019-05/msg00331.html
>
> Current ABI continues to work of course and be the default for some=20
> time, but building for new one would give some opportunity to drop
> such support for old procs, at least for glibc.

If I recall correctly, during last year's GNU Tools Cauldron, I think
it was pretty clear that this was only to be used for intra-DSO ABIs,
not cross-DSO optimization.  Relocatable object files have an ABI,
too, of course, so that's why there's a ABI documentation needed.

For cross-DSO optimization, the link editor would look at the DSO
being linked in, check if it uses the -mfuture ABI, and apply some
shortcuts.  But at that point, if the DSO is swapped back to a version
built without -mfuture, it no longer works with those newly linked
binaries against the -mfuture version.  Such a thing is a clear ABI
bump, and based what I remember from Cauldron, that is not the plan
here.

(I don't have any insider knowledge=E2=80=94I just don't want people to read
this think: gosh, yet another POWER ABI bump.  But the PCREL stuff
*is* exciting!)
