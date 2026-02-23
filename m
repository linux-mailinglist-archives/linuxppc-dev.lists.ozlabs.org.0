Return-Path: <linuxppc-dev+bounces-17031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI31FW4XnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF31736AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDj3bsqz3cKV;
	Mon, 23 Feb 2026 20:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837221;
	cv=none; b=A9+5PIdKPs26jL1ub5WQ6JnaLmH28Pmqs39W+bB2dJLlgw00E+1MaMldBv1rIJb6xqfMow/sYFR2WocLxD+oClokTBgR8kgtef+QWcleszK5qJdKsUFfRfim3mOrX0PgTaxLinmqQ/M/twAzyqz8LrxHrEDPvlMBYeccCsx45/piBw42OKbMqaOt/bHm4Z7PJVmKuxPzH+5uU7yOvEsonG4nRXVXZKwaUtZ7Sals7qT3ihhcAPTQvJVS9Py0sohffwD8mRFf297La/WXG4hDQB2jbnYFk+LuZdcSRNxjuXCnHBjDFbzOFNBAcold9bNjkmAOjr49K/4nMt0wVubHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837221; c=relaxed/relaxed;
	bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMuPfHx2wK8BXPexiffZBau+SMVHqibKPLMCSpcc7N+st2raVgPGF2RO5mSJpbcTS2fAD7TBSCNVa3oO0t0xSUww25Iv9Bqv4HifgpQIZ9TxYhPoleVF3OwIDNHasvQ24Bfk9HZ1pUiY2TulXDE1qI6ilMm1eonSOQCl8FKnVa2VsxvmVQdAv5Vqsv/nPjODjcAMQJ0BpBfQh82Qb7kwu1oF1/KULXxXybMFtnXuMxuK0lgM1kNCS/2vSDkB60uOOkhSkE4HvrcssguXS1r/zyigJjKBHHdI0E8JS+IIctIHd8XwGxfmqRtpUFN8YXLupLUdHacD/H0SdPAOY324Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TT0IGx/P; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M2bbtSDT; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TT0IGx/P;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M2bbtSDT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDh4y37z3cJj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:20 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMp5162481776
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=TT0IGx/PYUI1U7Ol
	kdWhf4gjUtimZksuqySAj9PKyiTbtTW1gVg4VkaQbbvu9xGcv5SIHNqkRkMHepfV
	g7twqGAQFobRdgsd/cXNgsHNgJ/YA4LMf2SF37z32lOEexmghS6ezEygxKPmyKYE
	o1sTZMCkUOkGo5df+14DsjSRzobWFnYlsht+rmhLzKoq6i2wMQ15klzZYcVMrAwv
	p0PuF9056UXiFL0Rbj2/JtKRmJGxsc/VS6PNggCqAb00Xs1LizbuKFdja0LTtSl0
	adfUiqxpOgTLQbwuOEuohEAlh/zIbFumspXaXWFeqmMNO6tKwnqQDWHqZfj+9wNQ
	woHLVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv1sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so4420588385a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837217; x=1772442017; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=M2bbtSDTdcdukLelVqbOw+liHWwQj0/9mM1WJze0NF90LaSigjIRB/DopWOTtHQOm4
         WMqCVmHvXqianclzaPW7P4Rfat5ID1aMcIzZOCVLlV8eWq1+fwdnUceVkTKPsjeQ5bMz
         Myyyx5+VLS43X8OI0llK6m+fxA2l0aGI/tl3nRE3suRA4uSKl/7sbkuLULq2ULYemQS9
         fpy/OHHZFbzXTZWyq32OgRB1N93EyONalSiczOFD3RTHJ/6/nL2AK/Dsy0dS/XiqhXNe
         kqdhcXHWfvk4YOO3L7puyB/vb8PB2Cu2D1sOSbgIhD1A1tTpFTzghk1bsvL0E+eOmdA8
         q0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837217; x=1772442017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=akUKjrXgZlEF9XP9NOCPzAQPHjTzWPITXhSJXdwVuzAfaOvwA0AryPgJ56u0zJfGAW
         Tdt+VvpG1GBUr5GwsNj/gSGvaNUxDaBBMkJeWVESQDfJU5KzCZyTQ6e0nzuPKs5FVcnl
         iTWaNRrE9Z77fNTaz1qdFcKut3S2cxdtCw6Jvh7+8Y5FZwtCj7nhziSJrTBa4pSKnKCI
         Avr9qG5uotr20h3ycBY5gwTrSyR8KH3RAdv9LDaqPmY5d/rqFwK9gLa47p2O0v8EjUBy
         RNq9O4wYKXq+eBaWWb6hoHVBdUPYscTglQLwp3XPtkZl9cB5kMKnmA6ryKmvynx/YXrx
         0GOA==
X-Forwarded-Encrypted: i=1; AJvYcCVaUOjOMm6VwHysQAI49KqNCaJDTGFUwq/vchyDEoRo+lNohwWRVx+C4XQyrpQ1ZdgNKyS0u8JdW0jBkyY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxesx27TJE/FieXkLSaENAg9A35KjpJX5xwdo1Z1sa5rSvlxj81
	oAVZeduN5czDEZWu533gxnIWHBD1F2+s8e55P9pMaiDlxe8rdOJ4zYui5NcXYYLhmvtqXzcebZw
	kV3GNksbbcziPB2DuE4TFDQwOq/naKNuX/BKjVrJLdnA3QT81nHbgXKVRn8WwLQwKP4WnvhhXxD
	R2
X-Gm-Gg: AZuq6aLngD15nNrNTncHI/7QOlGZiIoC5nUCBiFlJJCRuK3ihygPsToiIIcX+i5Nf2l
	tm0UBjNPz+BUMmLpbxnYkNYi+U1I3dX0Gt+2b6jHJCApNw4GmtlFuE6XIppZlLp5ODGGD8jaWyS
	K97yMRfXPKDLQ/KhuSqt6zY8fzIt+voR/Jg6C5uuSm3Bk24Cs+Na8NBiHN+d6cElCVDIoXV03iK
	ctny8XnOqYe+hmBTVoFFzhtq9eb9cLcnrCuR4Mg4cC0j8EUh1OM3gCVkqL9KsKHAgmuUR19p+vx
	1M30Qf80fjQhgc58ld8dzzPNcH3tnE4f28YnnvM/N0ktLfnZRbtv5ktC0wqgtOz295iJPiDGo3o
	5Sj9rs0peWMGIgDDEFBldgbwiThWnojKSIth7ay2227lRLoS4huyW
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946104885a.38.1771837217145;
        Mon, 23 Feb 2026 01:00:17 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr946099485a.38.1771837216730;
        Mon, 23 Feb 2026 01:00:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:39 +0100
Subject: [PATCH v2 10/13] i2c: owl: use i2c_adapter-specific printk helpers
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
Message-Id: <20260223-i2c-printk-helpers-v2-10-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcG0op/5Rmmcmy1LClzr9Cd5rvHSa2IOhyh+
 IHRW3jceAiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBgAKCRAFnS7L/zaE
 w5oqEACL8mqyvJjis6Rfx0rOWs5khRMic3wAg6GrTXJNenvQou1AWcDbjBunSF26We1tgWQEmf7
 VRCVaQ/cWoy6LateYwLbZVzpk4XNFkbere/m43SlqDPwo5mWGAF7HmASiol/gc4AnJ6gGEic0Zk
 47TiKxSQ7+nj4p9k2Gjf1BALtw9qKgtTXgZIQkG2Mipxi1fV6I3KnMXvY9LLcSdSanBeW6wgYBF
 EN5KAfr8gi0sGkley7vLr0vlCaL9fJUw3wvnoxaGcjKZPIqbjPJAAbio28UP7cwtt1fv7nTw4qo
 MtkuZG76tz6CpvoLwK7i8qoNFOZMHmqKXVY5VwTVHUa6adviUk/UXcsECWHknfSL1o/F28QPipQ
 TOxHFbOj9KmIGFJ1/G6YiO54Z13GwZRCEBBXi+KYgh9e6Dg3XJ965Z589WrWaJO2Si1wCWxNTZK
 cBuTsMAuNvrbrkcZ8vFSM96OHqLs18szgWhcgb3nuLqXqd5YdBfpms2I6hsaz9DXxqnTGXoZSBM
 1vNqLs2epqXyzG6VlfibW6cEzyb+80lDvbacE7/aVxEjQjMS8k5LTMSKMIue8o/ZvU1Qs2Q0kmW
 eBqKRa5zfF7/AswvNJrigg31veDBrNwzhG/+0B6u8EH6op2DaYyv/l55F29zOnJkV5kC9vi8FKe
 EXKVEvxa6w8ktEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX6sPPF+VgWtZp
 UKBM43SMQmRznI3vtaeQxCXO4P0UrMEl73rrpPxDHFguSykXQRczDFUarqcjD1418AW5p9d0lln
 tcrPf/0EIqq7PmKvy8r9UIjwxl2b907EdEbBwdZv4pLu5pmoDVRiCVgc+rYgkZzj7oKwMHU6Upe
 9dTTzCTiRu/44o5d8eqxHF7MFrqzK3k+WxIgNZKNWR7fCNvHP+YYyzcDiAqOEFI+nINYJyM7qzE
 LFlOF1qn3IwKNWB1MAzxebO1bTPSIqQRRFNVHCQoT1I9x9t+rQ+swhFpTl6xEh3tPs6m1+8XXGp
 hOk9p4fKZaczc8JJhfv4Fw1wFt6xf3k8IMtgdBx99L/VAhrfAYIj+YDi/WKAoA8NoymbOdxAXlg
 rRNB5tjNfy7yfQbTe8bikhvO08MWkqjNFXE4Ia7xN94RL1ct/9cm3XNI0fSgNlmACU1Q4rCuVoo
 59euaHPMFSh2nv+YGyQ==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c1722 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LBsVZo-S2049PC6Lshp28SmE5QAFAnXQ
X-Proofpoint-ORIG-GUID: LBsVZo-S2049PC6Lshp28SmE5QAFAnXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17031-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
X-Rspamd-Queue-Id: 6FFF31736AE
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3


