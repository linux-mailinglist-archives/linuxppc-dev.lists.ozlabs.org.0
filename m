Return-Path: <linuxppc-dev+bounces-17052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ59NUFYnGkAEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE0C177069
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:38:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMNx3D84z3c5c;
	Tue, 24 Feb 2026 00:37:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771853873;
	cv=none; b=feIZ5l0qHaEkUtWzR0NBkfWpN04QYpzk6oZbvmbaxCQ6QtMn+3oaO47kDNhRM93bgGzX3hwznv/4alTTMr3OeR3ghFphulBn4GHx6jDv3OuZrPKLhDXbYBBTCWs9sXdldWvFrWWOGp/Ifk60QreiCWKXcs0nyCoiSftGcGCzR671a0J+vkt4Pkhfd7M1qWk46gG9Up1uYDlxdCb1Cblft3dDrORyo5WmzLp47kO9y/D+EjiCU/nzrKyyh+L1d9+L0Y59jVp49UQ/acsrv94Q1L4kA7KCmiRA4KZsKLQw3ObYgvtc3TyHgt27cdCqat0FWmaQ0GLHwdhqY9+Ux0/6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771853873; c=relaxed/relaxed;
	bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COWM0sPfsWCHD43z604odPz8YA8TdERQ1utMny/WY8o77+JAtHqJLrHl+NLemyzgFj8z6g2KgkuYGggrOK3XB8caKuvySSNApPRbhJ2GH6owB2xe9p4PsgPVBm0skWzkYCjr7Uuppe9h0n35IpOq9va+FyURLb9EiYX7ZHbmDAyDGlCQRjD/kTy7h6QZrLLXOKi6OwIXD61OK4Lzfs28XnZLZajZlU0WMdiwz+7DwFGefXqXeHbnW5JalkP1p8v5a4f7ByI14v4izAS4nThQWjHjIlK69Ykvd1twu6ER79tp3CtUw5qmFkaOiBmCVbB2le3JdTyWgxE5s/upr7anAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLRgqxU0; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oc4l/7Zr; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLRgqxU0;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oc4l/7Zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMNw4HcWz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:37:52 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Y2151444090
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=; b=FLRgqxU0qrr/Y1KS
	g4uJW9Ub7TsH+DrfVQsrfO6XZAdyrQrdQJoOm7AeUs8wALu6bDJFxZ53WBWayDd3
	LkPcq93G2tl0yx3e5N62VoLN51pMyZAtNgvQc81E+clOfGM2OFzQ1477+MDdVtFD
	8IeOwUTxvti1PBYuEbE5kMpMs5VplU7AkEryuZJC0oHYnfdcgy+jarbsuHXy7+si
	WVvrt3Tsb+Q6j4qUAHnU4HwFZvZg1RkAvPEH2m9vDhq4RYZ4gAOj9Nc4xax3AYO5
	T3+PpQ+figj+SRdbm9kDpEQKRP6NfHqdi3aqb/U5LeGrke0m5J+IDGCrU1CgLn2r
	YhP83g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:37:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so1542371885a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853869; x=1772458669; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=Oc4l/7Zr4CX2UCA5c9NZZtGy0xX7hGnY/LtR7fGCHKtk5RxxhwFKmRIX6Kvd+h/gY9
         jUeeGLPp3h1NkKMMQS1qTPG6d5DvdCI+lczkVjqIabjdKNHIHtbUaHqL9l7PQKEVL5KY
         0s4t4JCDHq15seUldbfETh17tu3LdO0BYQCOyyN/LFSSwTQTs+HD5whu/eVVWMNNKC03
         f25gUu4rg+olMq7Bd/b54ASb776Ox2SSOO+l6Pd+yjmGLIUZOMthbwT+aiqty+IooqJV
         xdzQsnHnysFbDCVB8lYdmKMA2scb8MJLiHaju5ZVRXnKDRs+HJT+YG1IQ439eouVo9AB
         y8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853869; x=1772458669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=Ui+eQncK5OmFWG4nb/zpOVHBa5QZCVEItIfyJbaTjjG8nJij2f/PUNXegJ1Fnvex0G
         e/OaaJt6nriep1ENu/ZaoV83e0WXr+1L9W0rsBklsodcb9/zNK2a9gnjH3Xkd2T7p58O
         MNHVjduhkevg9FEhnUbsWqAKKZ1PPFHTsVjAlQKOUns3397mEy0QWnoXtzegRuhNwvmJ
         t0AZFfPj++y2BoWN1Y4MRNyUNG4hD43Lo29vYEyuL0ZMSz5411MAixjdywYeIvmMqx7y
         8OeOosQqtW2EHrh/3g3Wpbe8jyhG8otcHaQbD/Ky1ybTCXwSGos93a4us5TFx7oEcaD5
         Paaw==
X-Forwarded-Encrypted: i=1; AJvYcCWEni0vZ+OovdszV3ZSbVa8LYYtxIFltxx+wvSl+NtkXn67AOhF9Q2QuZgXEeX91BrRRyuCQb5ZZMDzxpI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YycvOcUX7Be7PeZvCT8mqTV46HIlDLjD1IOT7d6zw/1NLb4Q9wG
	2oDD3XgGUBQ6w6n0wadf9eSnsAKN7POBvjXZfAH4PIldH99s1F+M5InGZtmippubq0HrV34NMjs
	2RCKfbeKmhErl9wCE2zRcTHbZajHkZw9p6icpr9JKyiHLKqZJ5LAX7sb0fh2S3c11RJ+j
X-Gm-Gg: AZuq6aItihmCbOpi6FkV23AoMrYLikwkhMEtM6aMhFAV1+1S0oglSRxBPnVsmxzXXyS
	DdSjIJ3SQYnBhnAIY6IFDjbaIa+85Erx3//XHRbz4yhPT0Ei00hG11XclYg2SYaioHzQYxhUOHp
	lkyG9LSCq++I5xGg124vfqwxQm/+adm+qHfLasiaz+mxeO+29nR7VX4uEhaPPdTT1l4GxH9S/1p
	CKa7+mdr8u0o8XR6gMVseiLv4mhVZ7twxHBOTH0kd6BmS6gPaUWWf/wC9kLKmVjUdOMdizyJBaS
	QU0bz+EcYncRmESLrGKI4x2t4y2cmqoZ4LlwoQ7D3MChm9xqNlrblL6satPUDky6vZhoVsvJyRp
	V9PzZs882w1gPuirB1aGyFatiTR3d8x1TZ5i4FWjclYkVeWIlsvg=
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118017885a.31.1771853869237;
        Mon, 23 Feb 2026 05:37:49 -0800 (PST)
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118013385a.31.1771853868814;
        Mon, 23 Feb 2026 05:37:48 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:18 +0100
Subject: [PATCH v2 3/9] base: soc: order includes alphabetically
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-3-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wW8xXPxpKDmxwgZvpOfgeQnchhB1uWOF7QOX2KdsSDE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGmcWByg57Obv99hS6Oh69qse1rMhM733ND3/E5jFtmsA2uzU
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpnFgcAAoJEAWdLsv/NoTD9nQP/iPx
 B1jGPMqwhkHEFboaz8rKRAWDcT1EXyqV3r8zD8iUz1itnruVo9pkg7K0BTyjjjY5jJXxGEUDyln
 5VoUzvDH/4UR2c9L5gRSHhIlCNZ/k9h8n8rgrYB4Mw/4uOeUYVbhVorTpB9Bodbet2Nmh0WNRme
 iE1SrqmavcP+8nxdt3TosgeYOpFlYPS081Q6+PesWWEVMJNuARH7Fuu2cEZvFsCdPsQciNidWVe
 o2v6Sku7JRVbV3A5H/WE1A4N+zumd5+HNWXHGCLD59q/bhf3oiE9utrugRe+YNQiK8VDZ//nxsx
 UQHrtF4bWww7nKIfFEIuneWOLnbhwSMfjhVQ+7IOqvIkP7FifK6T7dxXThCPv1DTl29ZC7WlyA/
 +P+f8FyN4RpOjggJV12eAGSlynnlvk3mI+Ht1EMz2Rc6+a6pCsquzO0s3U6ABvvA4e9gTAGwOgN
 DoLLxLkJzKFNpXpfqp2zv6cMc+ESwl9TpcUSwChH6WG7yBbwAFKI9e5RRq+dNjcabAarC5DnVLV
 HxznKM0rD1zonz2rKdFy3LvcKc5bdjNY0RrgCDkOo8ijSqxWItBb+JBOGz6d9qVHLf3zrS7mUrb
 6tqTLtWMrWS5wHUlWC5rlXEDZjHx9qFqQZDnLOv8xP45umlVi7iOdAAp81H3/qSBWTrLDPe+Vz9
 DLrZp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX7XVR6bi8O7Wu
 Kcgx3IUU5rIq6/vrQI0y7RqTgSdbvJjww+3+JCQe3lq+rYgWGkXq3acuEBzmMBYGtr9qQbcnFss
 gQ+EjSXyuGdJ74GtoU5YWDM0B8hWvYiKOerLae6E19bF9zwQCY3PAUeNCCYGIxUMiFgiRgkKI9X
 VYBpDEfl7UZZpGZ2caaRBOuDHa25/nhTNDvNFx+uq6o7kxM/fn7GnGq46POgYp0BuAdun5efd8/
 1LGYrXs/1+sCgQD2f0uTBwLvN2j6POtpwC43ti6BiIY6tvk5batfkZeF7IWhKsjhL/4GCEoluiq
 F7pGTLTE1IS+McvVczL+FI6MTDYBlnutDdeP3LXpMHKNaU082ReBZ+TXWHVTe906FKZBsCTBF8c
 P1v1tdDXtQFSg8MOJdqkrwoQ899CzcFhlI6GNXYQWdzgHUkjbtGayNz3iryD3LlaGF/m27VFUM3
 UAv13DYagf0S7ic8tsg==
X-Proofpoint-GUID: vJSrO7xOTTc_on51LrZbFwAqUad__WeU
X-Proofpoint-ORIG-GUID: vJSrO7xOTTc_on51LrZbFwAqUad__WeU
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c582d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LcgYCWfw0sZjbfGval0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17052-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EDE0C177069
X-Rspamd-Action: no action

For easier readability and maintenance, order the included headers
alphabetically.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index c8d3db9daa2f02c93aeefda9dd9c5ede148a676f..48e2f0dbd330b8d402135ffa7308f454eb4ab7a5 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3


