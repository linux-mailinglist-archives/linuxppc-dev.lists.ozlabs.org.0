Return-Path: <linuxppc-dev+bounces-14962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E1CDACF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW4s4ZjRz2yFm;
	Wed, 24 Dec 2025 10:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766486859;
	cv=none; b=oKVkP7s4Q4Fs+qfvx0C6vPlLpOufPcnpC7k29PJw3yauuQKp2aqkfPIDUo6XYHQxvNfl1Kgr8HaxpIBRmtzs4s0kKT3TyJsEGodLEaEQYtMfgyjr4flF6Bfh49dEGSvrPZTldHTjqjdwGydts/nTrEFkmX2C7HkXNG5ZI8gOrdkXh1HH7fErcTnxkr6nvGRH3dpEKvSHK24nA9duucXgLCN0wczCZBncqgU4kEPRWfd/KU4Or0w6tfygvNElJWkKDIkJ6T997ccPRuK1fE9N81vpepdnyDWzrNYCIUPEfAXMuhng4Jgh1eNebN06Z+eGH7qvmH+ulsiUyC1kOYvwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766486859; c=relaxed/relaxed;
	bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KptVRHdfVMXsIJesKeVu/dnUHc+ra3FdM2A/oG/TgX7rLwomJXUNIog4EqmX1834G9tUUHr4ygoFJ3EZK0bz2kc2D9diRqhHRVkBdB09Q0B/DY3SxnqZcftP7vwHzXF5iSRSEi2H1ZPFDytAtbz7v1k4zQnVzHDh9/8NfUy8rFPlCr6zDzbtnPcEe/LP+nUSBSnZvzcrYRdIRPlFwvwMXL9WyIhJQBzT3hRWaZ4v/4yaaZvTZIwop5tDDPxd23JldG9tLUY0iQZ44R+p9TyLoCbp4gf1Tmsr6lqNMvqeFg3CO1s7BcgxlUinfs3Ij4NDuny3I8mzTAhhqrMBxp1Jdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDiMJ4f5; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AT9nTlTh; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDiMJ4f5;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AT9nTlTh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBY64pFSz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 21:47:37 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9uYk41530068
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lVsiiqxounOhFt8gtSCLzi
	paRc5xfLwpGpicl4jLsa4=; b=WDiMJ4f55N7JCXL+Mw9JZgABD+OR70NFiCm7PA
	31CrZ6a49X2RmnUk63ssf0Eip02NmxEy5pQI4vDGWfuvpeM5Alv+pcgXeDs9dT+z
	O6wtM3s4itQd1KE9/A9+OpljdGeE695oxgSONLdtngr78tPn4jB8xx/IRV6H239J
	45qpJCB5YcVWYSMMnOcR5ArHvxrzGbBIn7i4Ml7tn6dYOAlp7Fg6hzMkplhmwLpM
	JXCT+R+jc0pFlXd8R+4h7jMIP9V8tPNxf7QmphF002dxJAjY8WNMxiQeTKMGx3es
	TW5sCKD2GTZyZF8doXNw5iQZ6OQSY9Ch4kPb0q+IZ1u1jZjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3g5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:02:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so169733191cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484165; x=1767088965; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
        b=AT9nTlThQvsUGkErarcxIlw6VwsJemU/BMV5zu1s635bMYikDLjVXD5v7uh3HhZt1G
         AITtUkdJkmOjHIf4ynAt93NUzMwFtmf8Mz+p9cTPcIB7YhgGzUcLzkOF0CpoRdRbAdSV
         xKHBGUl4qt++gx4e4Ah9ZzLl7xm3ZlcPGnM7pn8+iIPpnt7i1UDMZQ5/jPb+/p931ulL
         Fyy5w29S+dJslDQZMw6Iqvmp4gRMmx1P5sIUpmv6CgSw+x4jgY0pEmwDNufMOIMnBuml
         HKkrUtn7KILHSUqK3zeElUd25VtLmEDTi9Bn6li9k7+H7YCxWkMMNRPE3wfsgOWp9tq+
         i/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484165; x=1767088965;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
        b=bLLCNSdWN2ZPBdh68FyfIf7VQCqQcw1VO7pUlZuylw5YEbwKadHfc7GDvdLt2qq92F
         sCcuj6YOhQDUg9q9rfWiAPINR481jwoqN9D6UdwSWDo5iLb+dW5yX+zapgfMzwts+Br8
         W6jWkOFPJSDkGk7BB+AaIFSgxiyPNdF3/RTvCtXIa+2zJG3XzuHIjf8knVAEsiP2JRgC
         m9GlYJXtxoi6T+gpVAeltA5xL/t1Hcn8TuvHb4RGjRaZG4gYFRzYEbagQFFfgbImfMwZ
         QEzkaH1HmKK/N0aDA/gNNLvd1G3w5AVzReb6HPPs3Wle/VChJHZexCnGvx2kPgQ5isuN
         0iOw==
X-Forwarded-Encrypted: i=1; AJvYcCU6y7O1qGrNNr+4qejZZZNNQNeRjeVSRomzcWiu6c00U23SmDilBIabGjf7RELBpFpq+8Sd+V96kwddq+4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGGq337CcbsCnZ2aiywRiaGR4h7Yq3hDXorOZpnbh91KEOM8/x
	tV4DIFEr3QaCAjWtj8eiBxGuinYSC/VJO8wuCS7Hr2oXOEKN6khX9vaQOXGhxclF/XjKFksvCzP
	2jBWFmkVsDsZ+b8PT1Il9JE8tDRxfMuBs+3i2pSUzpLYrCFaHX7kzIiDPmKIa7jS9Ip9y
X-Gm-Gg: AY/fxX7V+4oJdOBRoFuw92yq66rbFvKcxEJEOPUmDrQNsN8jRzTVtr4g3kp9AkbZu83
	YlqezVeeFtqIj9al7bhMsD9KOZTd/EyWimOtm0EQXVJPeGwmJom/FupyURUFzqYp8x+983YwNNW
	hAaoq4K6Mj/kwqhv/D/3ZInFe7VyngqauxvwXckR9YSlw4lYBr67nxxKTVx9gAmSgYl3T5jNUru
	loOauy+lKP+cUvUz9fEvjvYTffSyQlq8hpmK59ly3P0dWg3cG/Qa16O0NJTDn1D2pZrMEWOdLGu
	Bvt9uHKhA2df0W6LXTfyefQZveCrorEXQMF1m19rExAtE/FG1GP8DUxkOfufyZmTLWEtWBtFMtO
	qjizA7NeGhVaIJ+a9PfoXoLKRCkGf2ZICRnLCQQ==
X-Received: by 2002:ac8:5845:0:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f4abcb89b4mr199518971cf.2.1766484164791;
        Tue, 23 Dec 2025 02:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgOAvppFe+utmVWSJc5Fi7Osfe16Ny+TBuzlxFntilRe01w0BA2HK+q0XCwAWBLR6sJii+LQ==
X-Received: by 2002:ac8:5845:0:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f4abcb89b4mr199518481cf.2.1766484164162;
        Tue, 23 Dec 2025 02:02:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: add and start using i2c_adapter-specific printk
 helpers
Date: Tue, 23 Dec 2025 11:02:22 +0100
Message-Id: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAK5oSmkC/x3MSwqAMAwA0atI1gZq/KFXERelRg1KLamIIN7d4
 vItZh6IrMIR+uwB5UuiHD6hyDNwq/ULo0zJQIbqgohQyGFQ8eeGK++BNaJturmqTOlsayCFQXm
 W+58O4/t+Rw/752QAAAA=
X-Change-ID: 20251222-i2c-printk-helpers-a69f4403ca70
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
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mwDZA+PNMAadBUbyVdbpUvC9ahnB+8CAzRi/TqPVUr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmiyrwadEPSafSYG+ZitmVmW9YHm1TBBa5m3n
 aBg7Itr6lSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUposgAKCRAFnS7L/zaE
 w7lCEACFwc1erjteHjPbCchFkjEMwie8N3o/WH17ZxwRtvpaSLRqGA0OTi8psX5Dz8P3MxWysrg
 QTcJvUk7lt2X908rAsTZaJJ49baytToXbX9qx3i3dSUwpAibeeksU9Nmhtbi1+ty8L9j7dzNzN6
 yZBh25hLS6xK5SnJLPe11uY0M517V+7MvPtObQnqZnB56iG0hvI4E3w5WSbmzfvAPG24KSQYMqn
 BTTx/OlmcfwhULH+UHPyIcLvL5Nnz243GpwRbKgXjA+ErHh7ym2Och8IAPhQCwMDJQcUNsIu9se
 hX2W54J9zrM9DjASpJh30ECj0/FKJSN2NvrXu0vAVcm74LksPFfJuvNk30Aq/nmA1zPIYaJrVm6
 BwhTUL8zyWwMsYiu4tKuDP/t+zsFWfvjbDBqMh4x/8mpWQblzmpytqCud1GIrZc90KJxgZU9bdG
 ibCw4xwFY+GWFyHCYg1wvcZa38xPlQH0IYrmkb/ZBvhpSZj3N8+672ZwsnvODeOJegkufYNhunx
 DGB0ZpgJbUpNrY/z9YGrcXW3Y/IKO+grB0VzvNE3WEW1kYnTYZI9RU7ZPI0R5l7WALlwW3u7xpn
 HWlTHkmI5GG3dZri+dZG6jH1RADUEamjmOZRPnPJltogZNsUmV6hPLPJnQ3VneAJVnzpjhxbLUi
 MqCv6TWIcl6iAQw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a68c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7r7wYDzB2Ki_6CY1cMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RIzHP5ODHHjDNS6p08-AQDbDw0TSBKSj
X-Proofpoint-GUID: RIzHP5ODHHjDNS6p08-AQDbDw0TSBKSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX+m7sbvJyd6d5
 qznYf/hHXMtRxAv69KuhFBa85TjfRQDu3cNmVnn3wtr1UafMstB0Og+kYK1F+LO+mf9wAqealg1
 /ksasB8EK0cpyR93IxehzBbV6SrpoXDtpVFZ21zCusBLOtaRpoyaIpezu8/J2c4Qp1h0pm36RM4
 YI6T5G+MMT3OSrnfhbRGNBnWtxuvTdzF2xnVoqiCKrA/q5JH5xIXLWly0Myu+zV9qJfxrS92TnA
 4Lz+VOEA9Y0IqfaWAnAkhSrIMHRoQD2O9FHeHlTaa5Hwv82BqZDmJZnZmUtWRFvY/tgWxk08yFN
 tmT8qkPWt72t1glrTtjJDNXsbtwjszFj5exUSF0j6XQcZrr0TGuYAgJDhDXUgv90Db8Y2KqPIWd
 mFzUJcUXIdfLOtn9cqecVBvx1TaE65d//I8XjGMu9E7VQbxa/1Sa/2sgLkcfSnV1uNH6rpyzKJF
 fUEDQ5ygp22ZXxT7TXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in device printk() helpers
(dev_err() et al). It introduces a set of i2c-specific helpers and
starts using them across bus drivers. For now just 12 patches but I'll
keep on doing it if these get accepted. Once these get upstream for
v6.20/7.0, we'll be able to also start converting i2c drivers outside of
drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: add i2c_adapter-specific printk helpers
      i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
      i2c: mlxbf: use i2c_adapter-specific printk helpers
      i2c: isch: use i2c_adapter-specific printk helpers
      i2c: ali1535: use i2c_adapter-specific printk helpers
      i2c: scmi: use i2c_adapter-specific printk helpers
      i2c: ali15x3: use i2c_adapter-specific printk helpers
      i2c: powermac: use i2c_adapter-specific printk helpers
      i2c: owl: use i2c_adapter-specific printk helpers
      i2c: nforce2: use i2c_adapter-specific printk helpers
      i2c: amd756: use i2c_adapter-specific printk helpers
      i2c: piix4: use i2c_adapter-specific printk helpers

 drivers/i2c/busses/i2c-ali1535.c    | 20 ++++++++++----------
 drivers/i2c/busses/i2c-ali15x3.c    | 20 ++++++++++----------
 drivers/i2c/busses/i2c-amd756.c     | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-isch.c       | 32 ++++++++++++++++----------------
 drivers/i2c/busses/i2c-mlxbf.c      | 19 +++++++++----------
 drivers/i2c/busses/i2c-nforce2.c    | 14 +++++++-------
 drivers/i2c/busses/i2c-owl.c        |  4 ++--
 drivers/i2c/busses/i2c-piix4.c      |  8 ++++----
 drivers/i2c/busses/i2c-powermac.c   | 26 +++++++++++++-------------
 drivers/i2c/busses/i2c-scmi.c       |  6 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c |  8 ++++----
 include/linux/i2c.h                 |  6 ++++++
 12 files changed, 96 insertions(+), 91 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-i2c-printk-helpers-a69f4403ca70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


