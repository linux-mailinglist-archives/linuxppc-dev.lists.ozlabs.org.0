Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9005110942E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 20:26:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MH845MBnzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MH5w6f0qzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 06:24:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="eIN3TKVz"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47MH5w5Q0Qz8t0Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 06:24:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47MH5w4x8Sz9sPW; Tue, 26 Nov 2019 06:24:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=netronome.com
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="eIN3TKVz"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47MH5v71HWz9sPV
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 06:24:19 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id f18so11936843lfj.6
 for <linuxppc-dev@ozlabs.org>; Mon, 25 Nov 2019 11:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=MNmBp2YVpYlWXvbacbjEHT2PxlEuwzZsgfcr1Jyh5MQ=;
 b=eIN3TKVzfVXmHSqgu0DV/O2P/bb7TjjbBOKaHEdwvW+LlpInyodLFScR6csGgRKFJ7
 Zn7PMsaBZhfYR76SXYO1+twoZAAwJLRKunpHUYE8GLPE4T3dmLzAlZENTnn5oUKer3bV
 J2uA/J3fYk9aTPzxP83AG5deXYfPEzLfKbNlvA1dlhndFWRmnl0bzHNrnAhEFVno2VuP
 e65ckUVEPwino7VLf0/UyhC0cw+5gEthDWGBd148eWmjyXK/Kz/kz1pbHFEfSYtHoUNN
 6yDnzEXT20hjF+qaaJJtTE1HgW6npaMYIi00/qQQZVJa+b8Gfj7aQaeM9wmzGrqiuYoc
 yQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=MNmBp2YVpYlWXvbacbjEHT2PxlEuwzZsgfcr1Jyh5MQ=;
 b=APmRFHtQ35oyK/efG+5LzzZTT+igWwypdz1/FFRzNjYmN6pDQSgsWTm8gGnxBnyrqf
 iEWakz/50weeC9PqTjgRFDquARNqaXAoXeuIXlEcUzraZR0x2MHE1l+JyDoojnjyv4VS
 Z9mGZj91Kb7F2jl4Ws2NZQL39LwyHGLpmzYXGto/1nJxwQ3/vpoE4sDftuJOxoBcRXtF
 ZN84e0rlgiHGgItALJhp4XBGtCR+I9ncD8tnldytIS+D3GB7dfHKTt5NXAt2LimO3YTH
 O928aRt9tj94vaK1DT3DF5NxsDW12WaLsF5u6GsPBs2sOLrSqdkQsQHas7hMvAwOiuH6
 NLAg==
X-Gm-Message-State: APjAAAXnjKdBTv4yD2vVQvEMgA0fw44cuSV2se+Ya4bZ6NM+ABIsFEjI
 EG8QqiEdzPB0stvRZqnr4F3N0w==
X-Google-Smtp-Source: APXvYqxawKHUwhQwSOqnPHBN9XPt90LccuiVciZwSc5vsO49ng90SQEzd1PccYx5xM0JEO2kUM39Xg==
X-Received: by 2002:a19:8104:: with SMTP id c4mr16214376lfd.191.1574709853677; 
 Mon, 25 Nov 2019 11:24:13 -0800 (PST)
Received: from cakuba.hsd1.ca.comcast.net ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id 13sm4049915lfr.78.2019.11.25.11.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 11:24:13 -0800 (PST)
Date: Mon, 25 Nov 2019 11:23:59 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net 0/4] ibmvnic: Harden device commands and queries
Message-ID: <20191125112359.7a468352@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <52660c98-efd6-16e7-e66d-3528e5b32d3d@linux.ibm.com>
References: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
 <20191123174925.30b73917@cakuba.netronome.com>
 <52660c98-efd6-16e7-e66d-3528e5b32d3d@linux.ibm.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: brking@linux.vnet.ibm.com, netdev@vger.kernel.org,
 julietk@linux.vnet.ibm.com, dnbanerg@us.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Nov 2019 12:40:42 -0600, Thomas Falcon wrote:
> On 11/23/19 7:49 PM, Jakub Kicinski wrote:
> > On Fri, 22 Nov 2019 13:41:42 -0600, Thomas Falcon wrote: =20
> >> This patch series fixes some shortcomings with the current
> >> VNIC device command implementation. The first patch fixes
> >> the initialization of driver completion structures used
> >> for device commands. Additionally, all waits for device
> >> commands are bounded with a timeout in the event that the
> >> device does not respond or becomes inoperable. Finally,
> >> serialize queries to retain the integrity of device return
> >> codes. =20
> > I have minor comments on two patches, but also I think it's
> > a little late in the release cycle for putting this in net.
> >
> > Could you target net-next and repost ASAP so it still makes
> > it into 5.5?
>=20
> Thank you, sorry for the late response.=C2=A0 I will make the requested=20
> changes ASAP, but I've missed the net-next window.=C2=A0 What should I ta=
rget=20
> for v2?

You're right, sticking to "net" makes sense at this point.
