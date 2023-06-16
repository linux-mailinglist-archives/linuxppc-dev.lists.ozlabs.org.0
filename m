Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0107330DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 14:10:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=LSROzQYN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=Ji86U9fW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjJ095FbLz3bvJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:10:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=LSROzQYN;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=Ji86U9fW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codewreck.org (client-ip=91.121.71.147; helo=nautica.notk.org; envelope-from=asmadeus@codewreck.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 557 seconds by postgrey-1.37 at boromir; Fri, 16 Jun 2023 22:09:59 AEST
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjHzC3HfZz303p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 22:09:59 +1000 (AEST)
Received: by nautica.notk.org (Postfix, from userid 108)
	id 26DBAC01C; Fri, 16 Jun 2023 14:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1686916828; bh=9nXHLN7zJI9BQgtDSekrm26F4Nn7MWhpt5Ufa49rKNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSROzQYN44p1XDf+2jDK6y4IO+3f84MA/dZJKYHr/Cqke4E9x6H2YPKhtGMhlCiZf
	 LSKh++s9q3FU7h0aEDztd10ZE2W75uaQsM4r/9BvrClupAMJKAofKd6nzdevebCjhf
	 4amk4tPgKykV3nN1KUnogIjqrxpsdASaoVwvVZ52uZhTGhVJI5ZO9eNNiZLOhSDB2w
	 mdf0utjm8Fpmf0hLmbmieJlQInSH0labOum3GfIeuErQm91oADQabdiOJyT9BFeCfX
	 6n1Jkgm79netQvtAUsFIoub+YqcdPkYvsk3utgbLcQ68NtWqW/IfGqSNhmuWjqzhwG
	 c+IAb/cGE9JQQ==
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id 6809CC009;
	Fri, 16 Jun 2023 14:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1686916826; bh=9nXHLN7zJI9BQgtDSekrm26F4Nn7MWhpt5Ufa49rKNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ji86U9fWl3Vj1x1scsw7OZ+YWz25a+oPE23lpIo3uvIsNAv0eul8TQ3nO5I+IVFZ0
	 4oKbGD02L0ekFYO+F9FSLV4fVyO8bshdUTJFvbhW2eUDoebMR1kfOLFaZrrRxR+QWy
	 ibQOnn1tkHyvDs9+qtJm4L6aQMuW3Niqn713S1K3vE/4VNkj2yviH2j3N62y9h1/j7
	 xBEVx0tvTgvtQq+dW8HhZYxSPV2vZueokHZuZHnYHiGiHadIvJhD1Mzsvyekp62u+1
	 6y7dRsPpz4JKx+n98Q9kabbcRWbiR/EdIVhkvQTTbAIifCLBzbnBkXpZ8+greeNbxR
	 X7ORaZOt40+WA==
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id 82db0a7a;
	Fri, 16 Jun 2023 12:00:21 +0000 (UTC)
Date: Fri, 16 Jun 2023 21:00:06 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: ppc64le vmlinuz is huge when building with BTF
Message-ID: <ZIxOxj0Y-kay22Oh@codewreck.org>
References: <ZIqGSJDaZObKjLnN@codewreck.org>
 <ZIrONqGJeATpbg3Y@krava>
 <ZIr7aaVpOaP8HjbZ@codewreck.org>
 <6b26dfef-016c-43df-07f5-c2f88157d1dc@oracle.com>
 <ZIt11crcIjfyeygA@codewreck.org>
 <1686912543.c6zqyw5s4x.naveen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1686912543.c6zqyw5s4x.naveen@kernel.org>
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
Cc: Alan Maguire <alan.maguire@oracle.com>, dwarves@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, bpf@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N Rao wrote on Fri, Jun 16, 2023 at 04:28:53PM +0530:
> > We're not stripping anything in vmlinuz for other archs -- the linker
> > script already should be including only the bare minimum to decompress
> > itself (+compressed useful bits), so I guess it's a Kbuild issue for the
> > arch.
> 
> For a related discussion, see:
> http://lore.kernel.org/CAK18DXZKs2PNmLndeGYqkPxmrrBR=6ca3bhyYCj=GhyA7dHfAQ@mail.gmail.com

Thanks, I didn't know that ppc64le boots straight into vmlinux, as 'make
install' somehow installs something called 'vmlinuz-lts' (-lts coming
out of localversion afaiu, but vmlinuz would come from the build
scripts) ; this is somewhat confusing as vmlinuz on other archs is a
compressed/pre-processed binary so I'd expect it to at least be
stripped...

> > We can add a strip but I unfortunately have no way of testing ppc build,
> > I'll ask around the build linux-kbuild and linuxppc-dev lists if that's
> > expected; it shouldn't be that bad now that's figured out.
> 
> Stripping vmlinux would indeed be the way to go. As mentioned in the above
> link, fedora also packages a strip'ed vmlinux for ppc64le:
> https://src.fedoraproject.org/rpms/kernel/blob/4af17bffde7a1eca9ab164e5de0e391c277998a4/f/kernel.spec#_1797

It feels somewhat wrong to add a strip just for ppc64le after make
install, but I guess we probably ought to do the same...
I don't have any hardware to test booting the result though, I'll submit
an update and ask for someone to test when it's done.
(bit busy but that doesn't take long, will do that tomorrow morning
before I forget)

Thanks!
-- 
Dominique Martinet | Asmadeus
