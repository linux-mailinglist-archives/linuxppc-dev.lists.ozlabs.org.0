Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA43A4F5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 16:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2L8V58fwz3c58
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 00:44:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.a=rsa-sha256 header.s=smtp header.b=k0HU4kB5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mg.codeaurora.org (client-ip=198.61.254.9;
 helo=so254-9.mailgun.net;
 envelope-from=bounce+ee6c0f.be9e4a-linuxppc-dev=lists.ozlabs.org@mg.codeaurora.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org
 header.a=rsa-sha256 header.s=smtp header.b=k0HU4kB5; 
 dkim-atps=neutral
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4G2L804PT4z3082
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 00:44:16 +1000 (AEST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623509055; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=RhtvN2QTW0JZFH6Rjd3vbX9yOl+YFdfv0SB17b2868c=;
 b=k0HU4kB5Cyx6FrM/UIBPtCIku1SKtbNjdCm9wl6ykARbxvMzDtHf5oqEpfpOJe17LrWSELhO
 OsEP+QVb+qX6QF4AFBPSkjfzRj+kgdlWXtNsFguU9/dT3Cp9FtzFU6WxOpqM5sIzToBLH9NY
 qG3COBjl82y1Nzt2ZNaMMdzX88M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI5ZmEyMiIsICJsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60c4c838e27c0cc77f457e74 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Jun 2021 14:44:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BC8DAC43217; Sat, 12 Jun 2021 14:44:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 PDS_BAD_THREAD_QP_64,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net
 [104.54.226.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bcain)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EAC33C433D3;
 Sat, 12 Jun 2021 14:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EAC33C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=bcain@codeaurora.org
From: "Brian Cain" <bcain@codeaurora.org>
To: "'Christophe Leroy'" <christophe.leroy@csgroup.eu>,
 "'Chris Mason'" <clm@fb.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
 <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
In-Reply-To: <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
Subject: RE: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Date: Sat, 12 Jun 2021 09:44:05 -0500
Message-ID: <17a401d75f99$662cdc50$328694f0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQFXZSsKSQYV21VAkXhEQlQXq32SZQKLFB0ZAuYFiEqr5N8nYA==
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
Reply-To: bcain@codeaurora.org
Cc: linux-hexagon@vger.kernel.org, 'Josef Bacik' <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, 'David Sterba' <dsterba@suse.com>,
 linuxppc-dev@lists.ozlabs.org, 'linux-btrfs' <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
...
> Le 10/06/2021 =C3=A0 15:54, Chris Mason a =C3=A9crit :
> >
> >> On Jun 10, 2021, at 1:23 AM, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >>
> >> With a config having PAGE_SIZE set to 256K, BTRFS build fails
> >> with the following message
> >>
> >> include/linux/compiler_types.h:326:38: error: call to
> '__compiletime_assert_791' declared with attribute error: BUILD_BUG_ON
> failed: (BTRFS_MAX_COMPRESSED % PAGE_SIZE) !=3D 0
> >>
> >> BTRFS_MAX_COMPRESSED being 128K, BTRFS cannot support platforms
> with
> >> 256K pages at the time being.
> >>
> >> There are two platforms that can select 256K pages:
> >> - hexagon
> >> - powerpc
> >>
> >> Disable BTRFS when 256K page size is selected.
> >>
> >
> > We=E2=80=99ll have other subpage blocksize concerns with 256K pages, =
but this
> BTRFS_MAX_COMPRESSED #define is arbitrary.  It=E2=80=99s just trying =
to have an
> upper bound on the amount of memory we=E2=80=99ll need to uncompress a =
single
> page=E2=80=99s worth of random reads.
> >
> > We could change it to max(PAGE_SIZE, 128K) or just bump to 256K.
> >
>=20
> But if 256K is problematic in other ways, is it worth bumping
> BTRFS_MAX_COMPRESSED to 256K ?
>=20
> David, in below mail, said that 256K support would require deaper =
changes. So
> disabling BTRFS
> support seems the easiest solution for the time being, at least for =
Stable (I
> forgot the Fixes: tag
> and the CC: to stable).
>=20
> On powerpc, 256k pages is a corner case, it requires customised =
binutils, so I
> don't think disabling
> BTRFS is a issue there. For hexagon I don't know.

Larger page sizes like this are typical for hexagon.  Disabling btrfs on =
hexagon seems appropriate.

-Brian

