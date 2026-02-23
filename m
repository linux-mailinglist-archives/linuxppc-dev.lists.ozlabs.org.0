Return-Path: <linuxppc-dev+bounces-17034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIlIFI4XnGkq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:02:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F81736E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:02:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDt4f1yz3bjb;
	Mon, 23 Feb 2026 20:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837230;
	cv=none; b=mUaltR+1rInZ2Uv0NiJVX44STmkVQfVt46DD6b2Egj2lEX91WGOxXkIBHQ97t0MMSGZaeFpuDEaXWsUwivw+EO5G2gUlQa7X9IRwQnpviMb/KF4MlQBWhBArlApdH7JSH2IJHHrqj5JbZzTXcgw4RGlZaFa5v9OWn+8GgCEb2NBSPqSgUl/dvrQI48aDzSFjUMLulCjsRMODGNBiUX6rR8XtrCpwj/7Gzbtymj2enf7i2leRXU9R37Cazz06UFkUd0pkwUN3hyiihPv75VUM7uRWz9E6wTWiQ8sZLovFQAULuT1GgJCTgxpLc4/dsUByzzmJyNGQbTVYydxecqwOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837230; c=relaxed/relaxed;
	bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCFJ4/OguREgmTGRf2kBSJOBWTfPvSjSkKfAjsz3ccR44QzOFL0sumqkxjUkgn079x3oc4KxAKVQAK6/E+/oorbPLyxY7pDPTVN3zl45guGetPJEsU7dKoD3kn2ZNZrwJ5cMgVm1AQDSunTsmD/xwn5k0ypXcr+B2OmSlByIdRjRMSQAyJgq6oRgGUixA45lCfMkFIGmZj0UWuRhY8/xp2xB2D1PgTRAAAth1uFI8XY0ZR1q6q2fBI4KFdvQ1HnFB+6Hqo4trxIzXSNeCTnZTaXtaYARMkxFuOZk+DsjhvxoirJpPkppvqTAI5NxpP7z3N+KciA3MQE/jL583udLeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hvr7zPTz; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IEytU2Tb; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hvr7zPTz;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IEytU2Tb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDs5pxDz3cJj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:29 +1100 (AEDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMv8Da2278927
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=; b=Hvr7zPTzrCaCVx85
	+pWeuCaqk3ssZ3HpkZRf+BLU90H8Q9hwgIsSRvokmoMdvCIv/lykqwqQ1tVUhCyy
	0j9tZZE0BoxwcP+klWXT7MLXWAvCJQISCVuiO9J55chWHyHkCP/XhoZp/t4M4Y/k
	dFXBM4EPtwVa+4toWGGGGue3TaXQw1RivEQLz5Ypek8SioKEBaQVoDNT44NxHmEd
	Gu4ucWk0dWMeK/rCMfday9iyQ3Zup380LIaWK1kP0+m0RkY7MWFx4+0/Mn3+ysrk
	uiFCOmnQS7JElPU6r72eSg8NF6yTiIw10k+5nXvMMcpz7zsX5//azU1OEjB8BvoF
	pHcCbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v0xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b0d938dso4450226185a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837226; x=1772442026; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
        b=IEytU2TbVTbEtieR40MR4WSr463EGPEcq8nu11xzvt9lRMTgmW/BefdTt2OzlBH3Qu
         A+mQCTnMPKQ6o2L3YllxwinkIWBiaQzCmgOxsTcaNkFmYN5/wt9OT+rxADK1mf/b0FUf
         KsxIDSGMD1XiL8aK+YfMOy6qlNceVKrnOoUV9PjVoDG95qsB4MCoZ7UmPuiaRjPbK/Tf
         U+uuRml0y3Y7kCBUCTosg0ft80fEuB731ijQgQpIgePSLl/DxCe+iYV5H3TzY2dRa/LM
         E4b6tQcYKVJkYfS2bdna9qBST/XMg1QeGGVxG0YRZdqg2uV+BHZxI4YnLyN/QIaGE+gY
         TMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837226; x=1772442026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
        b=Dw1MCaSAV0SB2GzynH1g7zU7Qz/20fwMV+GVbEzFnXinXGPvM52dqSpBlFo3ngSxkO
         EBCxYiyHiUlpmzIjYElQd0dUu9THQRowvOcDQNH75camErOEYsyFs5NTqm6jHzpI9iJR
         wR9v4XLUd0LM8iZE5IaROPh44Y7FSbTZgYiyLWWHLOwvn1o92xPqIKInX+l/N0ITFs1l
         kqF2xWRRDuObc8traNeSi4YMzAPbp5npkNLTBL48AyftuJON1tl+6W9qKMOPvhn8MTtC
         aYNiLH0D3HFcfwHHPwaGLrPCKQgFZwkXA1LAs1MCHyM4DwQ4qgqSre3NmKbcsdKWsNA4
         kEAw==
X-Forwarded-Encrypted: i=1; AJvYcCXlKje76wSRL2x27urqXYddkEM7EaysCbZSU/WmcA7j7h/54gkGtd4R/sSl7Lga7jxDw010pT5KVDEOmQ8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxE66AjKM/V3CQc9U90FaNytB8/vcQ8yjajGhq2EqGndJVqCenX
	DIUOqFQAPaB5TZWsO1Wvyq3nnr7KOF9xf0S37P0kRh1vHWVdHFj56vVUVojCE4YD8ef7o3j/ES1
	7REORr8ckinEE6uQWh/5b53st+r3PVpF9l3Aj+uLCwabkjoUD4KtIra/kjhZXpLjlFdrEJORbFV
	rK
X-Gm-Gg: AZuq6aK6KEqrVc52gxLNPa9u4PpL/NVG9vUlwbHI/bYcizmUEVFCxxkQH5tM2gwXZjc
	7OSth2stABYBoZnsBxi616bj092AwFtK59c09z6ttMzB49lenF5F95yNUsQXrvdKKaOJeqGkbS1
	C62gAWGnr5qy4tEHhm5NfoJIm2S6u1rbekoOZF2IBsWBIPkH39BjY96euDKE0ANuokv+6CxOmQ5
	mYL9ombKtE0zSTFqyb5qRtkJbdFRbXFd2qXXmUh63h8qxeVWRygplZjrdNgrC0ShEpQxfnPTs9k
	zWw6XJUySIaO/gxJUgobLUc8MIDKS3upLMqtDqJyjTgOL1j716omc2zFgzgJZlmSxL3vKjFCMF6
	dJq6Q3ySuq8ynxSo5/Ws5gS8KsAgi847AzIDYFupmNekaOaapiQA+
X-Received: by 2002:a05:620a:318f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8cb8ca8962amr979348385a.72.1771837226512;
        Mon, 23 Feb 2026 01:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8cb8ca8962amr979342585a.72.1771837225985;
        Mon, 23 Feb 2026 01:00:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:42 +0100
Subject: [PATCH v2 13/13] i2c: piix4: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-13-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JDZZ/6aGOo6nTpfOU40qBlSpYdHiADcGwoYL6QYt5dk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcIdZYwirJnUNOGujgI7ogwb5RBbVsRgHzZt
 6K9WXX042OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXCAAKCRAFnS7L/zaE
 w/1fD/9C9lHh11MQDFHNS2CdDlMZobYyoli8+SLRr7N1NFuXSbJv/+h//P2hoBy0ke6yXqTJ4+L
 axzRX/jM2FO3L1ru6ZrxkjvExiROejYsY2HigPuosAHZEcMJHX50dppFDbhFtilqHuGGRbQ91rb
 UdnyjHFtSkUZAtT/ahTl9re5M8Vighq8YxQKegyiyrIfT4o5mJMMyI5gs4cv9wWuhpByp+tchBj
 n+NVrFNe4cUBw0EgzHfbabeRPa75XEGBdgCLmD/0BOT4YBwTL4BmfBt/4kazL2DiuU1ogHEDSID
 3K7NJSMh+04p0We0l2P8ZxiEn6EMBMjvh0h8wQqUrPdCEzBCNe/1dVdSthVFXYEppwL4ofSvok6
 XG9a+P6zSiBBE+B1A2+hmabACNJNMQ0AvZY4GXpDWjhOiW7QVl1HIiQEiPCyiyi30W+rVH4lspI
 8JUhkGQuwW9zYF/NzbMusTvzOqoJ0XsNGI3vHJPv0CqVQLX4m1bPZnqaf9OW+ls0gPDcrrK+oeq
 r23BCzSbMK80frsQ8dtiZGTXaAxlemajkek9awA8vE6y3aFEynS4iquHJ2E8pWSbYo4ke7/5C0d
 GD8jLMRaKsY+SoT4O7JObjMnj/9nVkONjeXiLY+x3XdOiJsoVn+/Tx1OvpSG88jXqVllU0NwSqV
 ozIxTLR3zZ0NIZg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c172b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8wTXbtB1O8xrs_5u375BJco2T7aVoGh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX4NxyTmkp2Kpn
 63NddB1fJCmyQ9KXOphXkwkGCbFWdvaSFEYdiqdswCClCTJz5j48Mk7nSXkf4QiZwe6td79OBpW
 tbcVNXfDWheSxnID5oWhNnBdNPjnvZtjqfn77Z8IbMuavUYko97IVw2mz3OV6xHUYKa/ICQYzRe
 gydzZFzh8q7/GOrRIqZeZSuYcMTcP+or3RQH7mUAcp5yGyNaVHiFMIIFx02aQrmCkknTOnPLern
 98XGpq3WUKHnvMJ2bws1xvLYeHGcUUKXJ11EBrkBDa/eW8wV1uTqoKE+1XJdqWwF7GqpLsEmiMm
 u56gXfcv3JvxV9S8dzU99CofJtlpkyCBAKMd9Tjbx4YAgUT1Gy3/pF6hj4+ypAjanpFXP4xuLMk
 ZqlTcBUU+8HkV5Hjd/umf1zG/Ylkci6Q9bxQ6aUZLu3J1qOrA+rCferRKrbCqfLhIuhGqQ80o0V
 o5/yveEEyt8rcQ9JWgg==
X-Proofpoint-GUID: 8wTXbtB1O8xrs_5u375BJco2T7aVoGh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17034-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	ASN_FAIL(0.00)[1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.f.9.b.1.2.0.0.4.9.4.0.4.2.asn6.rspamd.com:query timed out];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4A7F81736E2
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 7b6a4e201be4a211c3b84e57fb7d8e0adc9895b7..d7fa2fbace908d1c2de66aae152e848bd1678fb9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3


