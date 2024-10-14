Return-Path: <linuxppc-dev+bounces-2220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736F99CB2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 15:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRyL81Rplz3brt;
	Tue, 15 Oct 2024 00:11:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728911504;
	cv=pass; b=T0oHIT1glZoD2mxzhR0WDgjFsRSu95B1D/0pZVuBDE3KgQAPhXCmBMWnN3QUC6NlW1GsCvXXf8iqhczUFZm/a6o434ou2JQHOUw8WQI16qjexc5kaQEnNmyvr02QbOpGiwdOcDvqM2seHwwQRqfRK08FR26Katt1mxU2chpbmMaD15ZXP5HQuzQbmqbDjcnj3cNQcYa1MPt7o+jPNNsTwG/RG09JCB/+93efyBPlIRgmQafGk0jG8zgqK/942icZr+mxDGqziKyYaOVmOxzVvXlh/sBvysrrXKL7Q+GtGtWb0Ooy5fbf00UrZbwJ2NCm56JIc7jg449h6/HTKf+ntg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728911504; c=relaxed/relaxed;
	bh=x1Qjpspgumz3VePVNJKzrHQe41GIS6QOcZEIs3MBhOg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=FZOzZIiUTowQs6v5XEk6DpetZHgpJzFayAtbvpNzPdeuDS7Z4YmoZb/0xlzHoOt6yFddBroj2FcNgPrEPqxEF9e5FEXtGIsSvZrIPEmE4/fMMbUgLGlkdjqICvp7Untkx9HxT0zd83Vrj6J+PttFLl6N17EzhbTROMKz66q+h2vVqf9j+RQDmJ6nHZLXgH1igaqld/hQ6OLowNmaiL6o0ngvfLwhzuCtbcOvRw26rA9A4j7KxFdupAoTNJ6i/rPvH1+xEeJv93u2fj2I9yb2fAGHEoBL1044jKhfgdnyr1ZPnNFa9aD80FDwPrEVTUtNUhvGeU/UNenZ++WmZzNcKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JjribVjJ; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=UxzzAx7P; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JjribVjJ;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=UxzzAx7P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRyL30vSCz3br7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 00:11:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728911489; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sC21/wmfDMp305L9jQP14kr9E+u8s5PIhCfiYWFAQ16Ub9pPVASHT4BJXytfgjEPlb
    CsP781U+1p8gKAvZNfr02nxwT35YW8lwmz57LUVl3jsm/Uc9+8admTuGNrconVYisWIC
    7IxWuWZcOhqnykD/ZIGwUYqxjMVYIqQRsQZRV3dZMp48qknq6SKwpCfdUiy/knRVx1KP
    fRQov2omUOnr3KQU5waYafXNZIYQ6jABRmGZXBQ3VuDmLsxLNojCml6T7UxDfWiyAC9i
    UCxVcME0XpDTDtycEXJh/Sff7l3U6NYcyclfH/8WAHEqFEmfqAfoJ4OwRtzske0Ho7fx
    BNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728911489;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=x1Qjpspgumz3VePVNJKzrHQe41GIS6QOcZEIs3MBhOg=;
    b=CIlOUKwxWf8NUbeuG+u9jlEB4YbJnVtjJLx2Fawt2BWyma9VHeCWtcYkSniCAbmOQl
    xbBtRac3iquzcGF/xY//J593HYr4ObfIlZqYJLowazPt20NEd69VKTB+qQkp2KdKK26x
    PLkyVUpY60rVlMshx0fzljpas5zAcVozhyUr44M3yQfCoqArZn5DWCzYtO87i3UN9x7i
    YO+4BRapx+CaYJa/41Zuq5JE4bkQpUU/MbAMftOIYEAaEaIek5nR8pvKP+OMn+ykjtND
    GV72ZxAPrQ+RIaNaQwHxNVvzTZ9uD8tHvAFAF1jXxSmx97wK7OxGYSFNQCYNRv93g+QG
    QCig==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728911489;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=x1Qjpspgumz3VePVNJKzrHQe41GIS6QOcZEIs3MBhOg=;
    b=JjribVjJR5Rshr3DNwzGE1nSepomeSCC4k/xuvB1o5hLRpJRJGlPEUzCz47O2keqOy
    jQqckjgKxQvF9d2srVmLg4EOBaj+SdVvqsA+csr0JYiV+o42HeDjJdKC5YmJRWEGtRFr
    /hPd/GgQas3K4QZ7mD+LuY5WVbvR3QMIgTOpTG+xaovhSJfxn3R+71rLqBDmwPW9Byrw
    +SmKvPF5ZHEPjEam7toNtcCLuzviKhLzq8igbu700V1EMu5bNspqBub+suTVmnQD+QXW
    RXi+05nObrAa3qW9BVpPgMfDbU7BSWqcfbO+kyutTdQnPPFRjOwVRLKRjZpMyazBpNJS
    vhQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728911489;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=x1Qjpspgumz3VePVNJKzrHQe41GIS6QOcZEIs3MBhOg=;
    b=UxzzAx7Psbzzt3T9ENpW2YG/P/ebdoOtnjLk0Ih2wnZsq6pAhJRfSn+y9uBSEU7Pno
    njiO68YE3IviSnVQ7qCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpmys3mVCXrTP7vRMbGZpP32uUiO4WGM3yoRXUc="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a09EDBS3rK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 14 Oct 2024 15:11:28 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: [PATCHES] drm/radeon issues
Date: Mon, 14 Oct 2024 15:11:16 +0200
Message-Id: <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de>
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 "R.T.Dickinson" <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
In-Reply-To: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPhone Mail (22A3370)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14 October 2024 at 3:00pm, Alex Deucher <alexdeucher@gmail.com> wrote:

Can whoever wrote this send it out as a proper patch?

Alex

Patch source: https://lists.freedesktop.org/archives/dri-devel/2024-October/=
473314.html=


