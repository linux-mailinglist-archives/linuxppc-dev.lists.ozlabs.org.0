Return-Path: <linuxppc-dev+bounces-17030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFzNGWUXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95153173691
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDh1s1Sz3cJ9;
	Mon, 23 Feb 2026 20:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837220;
	cv=none; b=Bk3bhVD7tGew8IVQmros/NfMJBA9JGQb4vlENRiqo5lVM79D/t8+JxThEzFqcdDaxlUZyca6s+VEHkRQU2KvPwG6o/f9dJFNQAYc9U+KGocHgg2xQJ8SZlR1qxvfXVA56momeBLQJ3ZH4chtLC7162qiwnVkgxYH9WJQCYJ4ZbtlTBG9V5I/bVzxGiwrng8lVCUVPF5kRu63K9vfUndT2i3rM2gcru/WkHnHmbJfOGaZrlajvK0nKimeOJNJGO087mf2A8G0xo+j33SpSBm3VNYoejCdQ697kv6z6A6SZunQlhVSnGtm/j+oJduybY5DDyvZY/UpizAimoZBef7OJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837220; c=relaxed/relaxed;
	bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwOerfbpX3GZ6QIwhs9Ckf4uuentJrXQlN0LUH75iQCbiar9RamRAtZ/55JXytptWjOR2MIXZoscFFIvR8r+GqKvef8iDQUNUCOuM/5Ft/NDVuiPyHi74SrgwjdOz0UPZSjbnZDnq8TiKOLvEi2Nd34fi3GehN8koaGIbfHGfjyAJ8ei91wnIGmvXySvR92y/aaq0LkysUdz4MFqagKibAnzD6OSnfTjI7KOq7ErNbL/QAR4GvGbbGoghzlfslUFrA8yraw+V/x1DxTZOQmhyxDth8v0lbTFfDdZ4HAa5VNrGF6YAcdE/iAhWeDADIB9/YP5+tcVK1k/1IR13AXsjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0N/woDF; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrKAwmr7; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0N/woDF;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrKAwmr7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDg4GDwz3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:19 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNRhp01262788
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=K0N/woDFr29hUgCL
	j4aSDpX99bJZJUbqnsHkF54vWRZ2E3TE6N6BmrLpb6yhd9J0hJkoWckH0PsfsrY9
	wa84yN5dwdoeHPLG3JaETb+M+1cRKKNc2HAgnRNoS1aSpgbKfmFyVfJpUEDtzxeZ
	QgliwKASu4Hi3WzPKyWMAHJ1P0aLlK2oOU1K0CRdb5SLcfZ9/4SADrgHXn0oYnpB
	vighooS7fG02Yyo6y75JFnllJ1bfqvApzfIb6LYnbqn3B9RS9f0p4QR1rE5OUSgx
	xWe8J6lDTWWXzLkQsr79kCH8Ovecmu4vEgTlEQQJag//jTYLyi3ca8cWLLIFxxgE
	tDKP6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m2bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4e37a796so3428770385a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837216; x=1772442016; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=WrKAwmr7KVQ0nnFREJ4R6G5sGOSuDfC3MdFg6ivnvrvOkLgN0CnmPclzdbhm7IO+7W
         YLU8TP1illCY6qu2KLw81nP8hm8dXwYXx2k4VLNmms9QaOxVs6/Eo5QJdpUT0HNdoski
         M1fWQ1pacmaO/fWJnfYcCm6u8sEK+/rX763pK4rQiB2oYXT1aGhY2iVUQRjFYAvx4iyU
         UQpkjtEYMUKDIrA3K8R9cJgVj9KgncM1eHgJlwBI7ENh5LVlhA8gMVpiuLEJGFajvTlY
         nhwIlaTG8f9uYEIVxqOORNIHKpSNRM44MZJEecKHuwgcmGYWM5JbY9kIJbBErKfRUw3+
         f2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837216; x=1772442016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=K6ILaaW3OJ+Fjg93nuXCiW3zU4GhLEnyxrdlaMgzNoMdLKipl2L9a7Mk1ndsuI6nn7
         SWexAvtQpIJo2FQw92qowAgFQd8KQlM+IWgUiVISrm+SSKHPDLCs8vEfG2bJcWa/kcXJ
         WejGRAKqGSKbt1iu/ntQzkbE1flP6rqFnAIOK/zshNnheGOEyO+rNmXL74/geJ2NoQeY
         9r72xLNbnyt8k7ZkoswKvEAXkm/1JBmslEwlxX80UgRc0GXc4RVEkO4+hHnNrOKjEzcQ
         zPM/FIhlsCOOh1Qeakr/LZRGTdUcLyXvgYd7kdLrHRtE24M1o3yzC4fuGGVg49MPetla
         WdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUESjtaPyOT00ViYvewc/KYMDM8qG6H852fZmrI3Ua82xEDVy/3tNZqTPb+ZimpWJzukHcSK61/DAX69g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzK6XOrtzZqmqXTmWrCiI7ctWdwaqBxCPh0+4ejvokuVQe+0jb+
	0uPZJvExMa01CZiTp0Z92hFPEBdh45rqNh7j47EOyz9UBRH9eeqCczN1ps8syewQB08CjIcfY1L
	hXdtnVjo3aa8n8BxrK+SEFc8BoqUUxNMQBvme9EerHaRUIZPySKmMKPdbosLtH3NmMSfUp+k7Cb
	xJ
X-Gm-Gg: AZuq6aL7qPvT3hV5IsEkCz44sIxxKzXjno9V4MVNZOSV53gL/4sukpRDx8cLyk7yLB+
	2WNV9a1JSfNKXaCQZvO5ogHJLrvPKNk68B2eGdgKfw3GkgENb15tmjGlb2PHP+n4CReTLTq18xR
	FH8x1V2lbvWZLqYOO4QqL8gfEXnTry2jOxAJMhJOWd9l2087gPwG2bggEw1O9ZZOjkVuP9BR2Lh
	OZorgFyvmTnYDWWi6uMWta9GqTVZPeO9iIU1y7668QYkkRDnwtClUup3PpgSPvX94IgEIXexR0/
	FtvThtOvzbQVofFz8MVviXqIfsqCoWSFrgUhRqgiJGB06eqzmpTJ9xrbz3yeD2TmWy1QXFeDE3g
	NjbUs8kxOgY4Qi1KjFSe8r1iglwN0U6Mp/fH+TY0Nw4v07f9KaFHs
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951742785a.24.1771837215975;
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951731085a.24.1771837214830;
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:38 +0100
Subject: [PATCH v2 09/13] i2c: powermac: use i2c_adapter-specific printk
 helpers
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
Message-Id: <20260223-i2c-printk-helpers-v2-9-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcFq5rr7pZsKaH0vo50s68t3HBi/s2UeO3pf
 cyse87kAE2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBQAKCRAFnS7L/zaE
 wwvQD/9KQpGaSOnhf7D5wLXAJtnQ/I9Vwv8R/l5Y+cN3CDNCgFgfSuV8c71GsQwvh5rVVtCYtuI
 O0v0A2OBZs0blNA1qvLFtl+B/sCtCoAuWmbmTse+WATvyGDO0kn/cabe2lihk+xZ/oUzJf1LU6v
 JdAjq4Epdp+fHbNELIyQ1jBt9UPC5J2fmIbgHqZcX8lOZvx4Y524oMJ4NcXEkTLAShJtZiFMTC+
 4Lxl0MTG4YjeeoyByjGFZuskzAy7Uuq3TIGwCkFINVGezKvdEVYcWoAwtEPKM1cire1U/HOJ03U
 M3wZxH9U2KmoVtcm1eJvyPAKp83Y3EzpgGVgIdW0fsOV4brc8ppWTQ8PcTTQNEtA9kcyvYWREAx
 9/TFULQeBL+tzYS38s2fciWkKtrXyaTKtHJ1x9uOazhuzE54jUFHZnF/EyZTNqqEyhsDib2K1p+
 UGFV7sUXMI3+ZxPU/l+iURu0zhIxQCSPGzb6L93EZZ+j1SUDTQS0u04wVUcKHejW0rnUPsRMp0i
 aDU2wl8yMkmu/EerybVNislobBDsx4vSVOtRgMxwY7iJU49TA4qZ3vaBAxo8gKOHtrky2CP39AV
 nk3WeuefJSAZPiKC/jAbYqThvGTXNtLxu/a2PkSu0s5P5PwgDE/+RvFp0LiA4L23pNvBnmMhRlq
 V+y4rtaVTGtj7Ng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c1721 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX1QSdArxy7Lyh
 HuodJh0iLz1moiAnli9XKlTObKGPGExhIno7Dx/8nCQJH6GAQ7AUhVBRBhep+y1ws231SSNOvet
 KVGpab5yB1xQTTq1Z73p5iUkQzPAcQuiPS36UlUpvdlXx1CasweRwuzrm1neI13Qzc8lgIUAi/N
 gP9yPvg4x0o8J/Tkzx7VAjaPr6Aim7ZqsW+hMm5YVmIggd6pEEzkZDXhNd96Z0uqqoDBH4jGeN7
 fk81p5wWGnM4SRLhLaWa7rMFr6oKcXynTg2wfueUEU8A13ZVdNloiOlWtCmixVibS4wHRCIbNbY
 6rrS47wAJo2spWm0+ZhTSJBkWF7cNwPU5hz6DE1NoawY/fEYT82DkaUJPfXrZMk1x6vb5bNhl5S
 IUsk7WsnYxBW1U/MMBcN4FiHhHpNL25L34ukLssbOBKpkR2RusuagM7laPSFE5qseiSRGJEZ0/0
 fkrsMTk9daIC+FEhQ0g==
X-Proofpoint-ORIG-GUID: 6So2paYgVilwG2Q2vV_w0OjZXR5xosiK
X-Proofpoint-GUID: 6So2paYgVilwG2Q2vV_w0OjZXR5xosiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
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
	TAGGED_FROM(0.00)[bounces-17030-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 95153173691
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3


