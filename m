Return-Path: <linuxppc-dev+bounces-1739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5798E93C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 06:57:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TgsjA3bS;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aOB85KKR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJzv26RWDz2yPq;
	Thu,  3 Oct 2024 14:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727931454;
	cv=pass; b=Y8DzNkJOLwMBBMEQH9gw5r7ZvqHM9RiFTjbzOcWTgIxfs3onmDLGbgnyKBQslTWLjbf/rW75fe9rMyLcRaHrItaAg8plJQXornbCwYLSVxOqKUlEhbvCHQjZEfdiZrzN0L20idcSvK6etwRPyNI87MeR0Y5c1dfX5jKib+KBQ8Fkkj3vmm+/r7T4U9IOuZ5gd0PB9J8kun6JQ6D7jOpUiw/yNR0uUY2OIO66zW70d2AzwWV+19tIhyozUQJCtWsS2/O89Ktg37AdSpl6ulpE2WSAsUGoLycy1hjPFM+LW2gpG1x5E3XXIjSVrF69M03xObR4dNov5uo7GUgoys6XNw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727931454; c=relaxed/relaxed;
	bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=YzIoC3NnwnAs5EVgXRa/bdLVDlE/VjTS61aXkZQy1xfu0IxBdZmUXEe0AZRhCh2E+T9mEBbTJLZZdRaaJFHYj0mNKPjv5ACjZPHWCjFcYq+fgkUAUYHXULHrHuV/6ZLyqqyYkSC+qbyEBHk0Fgf3IIPyZHOB9zXA99h3n4BPBX6Hv6/r06gZ0+EoTi/WSgINYGVOvl6o0BbOrglEr3hL3saWRKz3ktYHWYCrJ8wYsiOjsxsKXKjlCQmgrk3OH8u9oY/YzDMAiz5GdhXFs5LkO7/xC2ksXVKE4G9poTzEu3QwTpFjjTs1IkCeS/0ROZh1aQ8FBZLKKUAOo4TpUxOMCg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TgsjA3bS; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aOB85KKR; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TgsjA3bS;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=aOB85KKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJzty3Vswz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 14:57:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1727931440; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pRKAbmJz4NNmb6lgSF+3VhXm1I3kNUN5HQO+T/HvZgaKgPC+0C41risYjTo734mm2X
    mSrO/ViSt6+1Q6wCc/I7EZPgbTven8yQC6O/CPoHLX0Tder81nyk7t2kEo9CgDGNGPN+
    rF29Yd6vKvreGzzVqkY1uVbUIMdOUcGIoJ92GkkqE8L89Irdd7o3gWcx/Pjqd9+J550a
    43hwtMSo8nX+2EWS2UTxdjhSyUCWQw2oehqvk7DaYVFm0tM/u4YoPPn/WYCc9eL32xSV
    JSwNfxZmzDoRy3wGdl5ICI0FGGSb31UO+LPrtz096xIF5MrhiZ9faTp1JnsZ3IMupNVQ
    2tCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727931440;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
    b=oGaPXTlQxAQ+BWByRVkf2XWz/Fki+tSPt4jxPo5T0vYMmEvtbhKdarZl8Y5aUB/713
    53NFWhUna1iy7ZNheZPzVZUmvF60zhzZXPsL94o6Tm2MoJjwBe5CBbvZlz3zf6WFo3uG
    RyP7ZTYJa8NVj65xtihKXizf7bnsdHXzJUOdQC0VyuW/CCfjU9Iv8IISdSndb5P8wxg7
    zcIId/37dIOAyadwDYadVWxTA6kKu4p8oCNBDSOlsFtpvUbJmaK9IBdLhZfovyexHVxE
    Cbzln7jW9cHQyM5cZIrFxAawXCV8XFWmANK61Im4mb2Vt7hTFw76JDn2Gd7tCzQ35veG
    acGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727931440;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
    b=TgsjA3bSyXahREKbnk822n+dOa7HnbM6e0epgpYw+KD35VC/5xJvbMlCnQdXxAoYUY
    vZZaYSISb+5sLVJbRfsf+k89yG+am7RK2f73QtN97K/YLWk6NZfIQttH0+qPeRV5qShM
    4DZONs3gl+xuW9m9CQpLymqpHEpAzQ3rMQGgUao9II/gGnKlWuv4YSfqZ8pnf3aJ3Z9G
    n9n8LpBUC5uu0dhMcVarWmcWEIboeQbpB4FIkW5AJ4CzZt27rFeTtj3MaC4+dAZnQWtW
    tLDZBabr4JSbYBZFmI/4jtQ+8+f5bwnJH0iuszj/8GCvQ845g/HCeaJUrKekXe4oyXoX
    4Exw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727931440;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=l8tXRBXvq41KufaBrKD82QFLwhAfyIDLTI0IxsQBBBw=;
    b=aOB85KKRXobXBhx1VKHrUp9bS0d7IvOGR1YTAt7pH/kweX437ZU/ZqJ63HG4j0rbNg
    Z8gye9AMfp4ThVccZMCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpi0syjFWi9m9O3sgA3QTEOTx6CJ56Dq+2Tx0kA="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a0934vKbnE
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 3 Oct 2024 06:57:20 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
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
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Thu, 3 Oct 2024 06:57:09 +0200
Message-Id: <F25FEC33-B662-43B0-9BAC-99482CD8115C@xenosoft.de>
References: <CANyH0kD1Q8PvRaMkBr=0x7QHzkUFheaMfL5LVeDaaj3FrBm5XA@mail.gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexdeucher@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <CANyH0kD1Q8PvRaMkBr=0x7QHzkUFheaMfL5LVeDaaj3FrBm5XA@mail.gmail.com>
To: Hoi Pok Wu <wuhoipok@gmail.com>
X-Mailer: iPhone Mail (22A3354)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 02 October 2024 at 3:43pm, Hoi Pok Wu <wuhoipok@gmail.com> wrote:

=EF=BB=BFThanks to Christophe.
I have figured out what happened.
The connector is registered before the device,
where drm_connector_register() states that,
drm_dev_register() has to be called before it.

Assuming this is the fix, I will send the patch for testing soon.

- - -

Hi Hoi Pok Wu,

Many thanks for your help! I am looking forward to your patch.
I could try it out tomorrow.

Thanks,
Christian=


