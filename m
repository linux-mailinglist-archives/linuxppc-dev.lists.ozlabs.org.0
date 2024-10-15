Return-Path: <linuxppc-dev+bounces-2265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3341699DD0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 05:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSKz967Ftz3c4M;
	Tue, 15 Oct 2024 14:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.84 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728964597;
	cv=pass; b=ZYQHkgyku5VaZof4YZc5hqpmhVIFPt4mgHYTOJE99NrK9sdUoEF5GcHufL+ErGDaggX/pKY8Q9QszyVQzhzU5EhdTcYBYy+SwuiJQxXe8w2AWyc4FkTuyzHm49BV3Y3THGjtC4EAkQ8NuLv+p/UAvx6XgxYL3MugfvbYTJ0NuYYhjLpNbgn9iKXwpMLyf+S5oqKhPNMUCIdWrmP6o19MnoIsIlex5DDPT4LGnW4RlSvrJstC8al5AFUC6dVgfMvPYL1oRWkuUrtn5FEqATSr3HuBNgRBCSJhuwatc3qOwa5zty1jcp5Dat2XAn6iS6Vt5pRp9OZLZKLlgKVAdjzHNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728964597; c=relaxed/relaxed;
	bh=xSYQ6qR2YyPxkEpPkVlGgPT6KdWxjUxQdAsacrNmW3s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bYEwrk9RGFEQtk+FNNBuhuR+lCa2SxmPeTyEAInesdI4RkdJIkWJQQyzZjcc/YxM9nUGSe4cOF8l6MyhRNtaVlj1DTvzADowb06TvQu/pVqZ7y6ajPqPIk9MnBpJcQwWFBeJtWGluoVNdwonvuD2xLsQhimnZMr47u7871jY8Yw16thqXB1FJ/cOyaQ18CnYFP790glit9B9qagT2J1/Kd3EN6qlKyf44XswqeETTZ7+l9btf+E3NhZRic+IEyGkxLt34UXnavoah6kcPskA+tN246WtpdtagbAKKJOARGJmfopO4hFxO2Ic7ljso8gAEXQHSiJV2VXrX4FFli6xDQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iSO2W6VF; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ZQsNhQxD; dkim-atps=neutral; spf=pass (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=iSO2W6VF;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ZQsNhQxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSKz51Z4hz3c4D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 14:56:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728964576; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=S7OIMgRlV4Xrj3QADGuxnIDb8HtFVUbFmdB/VIOcNrVRiSXwgDhytFtulj9m/xsAso
    BAimUAvmje81PgA4Yk+CiyYZejz1rv4SZyQOnkb9K3b9L2tDwex7CLnY2cGtKTGbSGyN
    XzwlyCaOtaJWPdLHx+PkHVhONnn3I9+eZFS55iEylZHiqynAxW3JmZ7yVk/iwYZvtwk4
    1o0U4337eTDUUgOka90P+nlPP4IvT1RODN1jPZc0ac+iANaNUa7j+4Mrb951hy8HtjaP
    BlmbMOBrppVBqyrfYMGjg+ITWiHSd7VzNiu7EIVMgQFR+m/e29CYEFQOeEcO26xvy+J9
    DfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728964576;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=xSYQ6qR2YyPxkEpPkVlGgPT6KdWxjUxQdAsacrNmW3s=;
    b=RYSxsU6Ws0WBXPfKCtrJ3wXIXkgEAaqe4yimAtI5mFBqwOizOejuNsopR2p0Kh06dA
    f03uqM8NBYXZenIV8OxK7Nzx9fphI3UYa8zatilpF21TinrmC6ki8j1BggXbgQY39NkT
    W0DXxzDgVRh+z/vkO+p4RmLNmWUEsGKFBAYZOomIw3BaBibCO7XERr3zOpzLi0t0F2mG
    9Q2PXzcFK5kuh8o79iCLFpbGY+z0eCCIXp8i0dTVZWwRW0EP2Yhx/8mXeZYykkH9hC7M
    hfL3rMmY7lfIxpmZtczF56ME2kgkvGXg7m5cGF5DQBwNl17kgqDEOuUaXXUCqGyEY9om
    +8og==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728964576;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=xSYQ6qR2YyPxkEpPkVlGgPT6KdWxjUxQdAsacrNmW3s=;
    b=iSO2W6VF/s/oTpKAYTUeEasemUzmR9ZDOvAuiXmgT24fawC5uHTAM4R68LFmuxrGSV
    GA+RbLdr68DT5WPqdb3F9vm+O34fMnSC5jppeDMLp2umU0bhNn5aL63Q2DjbblGmclUS
    rPCukvy0Ak442VYYQPr8J+dBf0sGdhv//Y6z+DmuPfls8VeyiKFMMmzMvJGsFCT+u1fo
    c56I0R84ICE2IfpP1wX9896ZRW8T/6ZwrpYgFzM+FQZL4dXpCZpY9C+giBgsd3Ti0fVI
    UM+xsC17rtnjRT+5KYQfdphnCN4wSm83oz5mrrIEnys4cNmgjVTIj19YhXb0ox8EYZ1v
    rweQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728964576;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=xSYQ6qR2YyPxkEpPkVlGgPT6KdWxjUxQdAsacrNmW3s=;
    b=ZQsNhQxDyQiOr7k3pN6/jusi3ECKbo1AGT5Wd1p6UI5ZyqVkQO5+hYO9h+f3PXc46r
    ShJLL/1V+qCbBbRQ+oCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpiws33FXnUI/9PuhTYBjMOp1+IsL3lZfXddq5k="
Received: from [IPV6:2a01:599:104:61f9:6491:b2b5:9c5d:4894]
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id ea02d409F3uE0Yy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 15 Oct 2024 05:56:14 +0200 (CEST)
Message-ID: <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
Date: Tue, 15 Oct 2024 05:57:18 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCHES] drm/radeon issues
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Alex Deucher <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "R.T.Dickinson"
 <rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
 <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de>
In-Reply-To: <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14 October 2024 at 3:11pm, Christian Zigotzky wrote:

 >> On 14 October 2024 at 3:00pm, Alex Deucher <alexdeucher@gmail.com> 
wrote:
 >>
 >> Can whoever wrote this send it out as a proper patch?
 >>
 >> Alex
 >>


 > Patch source: 
https://lists.freedesktop.org/archives/dri-devel/2024-October/473314.html

+ ville.syrjala

