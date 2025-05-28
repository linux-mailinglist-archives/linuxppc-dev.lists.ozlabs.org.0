Return-Path: <linuxppc-dev+bounces-8966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5BAC6527
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 11:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6k9Q0T4wz2xGF;
	Wed, 28 May 2025 19:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748423113;
	cv=none; b=epadxUzB+mgenYrX/jEHCEsf0yw4nsqIrjASjQiI5Le0+C4VmVPHnNy39zSWYtmlZ+/B/4I4EJRoD98PsLpBTANUDSNpNR138z+cyJL2HVYie/ftl67Gj3fPjqdzjzZn7y5j9lkMrWvK7bA7/cuw0err/Thy6cRBdhL4rj9CRkqPRmKwjyecLWELO3TcerabRaUU6LwT4eFmk6azBQDWMytEZjzgKJQDLTOwk3tvFsdOSok3Ve6Ip/o0gEHK3qxYMASxsTXwz0H+/92nGp7kyg/ID81z6fsWSFrZvW6oIcgWURrgd+9+VHPF5fGy3DQIiDBthsSgKgOb/dNL3WyVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748423113; c=relaxed/relaxed;
	bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic6psus62hSdVW04HbmQEnjFbmSiyTz2aNfCmzVz6NlsheZy6fzJeEJK+2dTbmaazCvT/hjZ1F4Pr5gj5hPpYvLxvekD6gikXasp4gfHeVRcQko0Nf1+Rjhyv9Boq81kpjFmQKZjuJyhSPtJ6xT4Q2iyBZFxyzEvHUS23a7qfMXQWn+6CUwa8/3cgaI3oDbfo3MVKbnzDoQeip/0D+jYlVyZx09mzi5yINbAmNFr4Yyk7FGkIhmYqRxpQZRL7HTDE0KdK03b3uXHCd/dxqjlEb8FpP//Pma9OUDwVSTkzNr31L8pIfoOwtybdhngRqEdzKkEcu3HwE7LOpgFjb/8Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYX8fy24; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYX8fy24;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1096 seconds by postgrey-1.37 at boromir; Wed, 28 May 2025 19:05:11 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6k9M6Ckgz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 19:05:10 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8kn04019648
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq9tbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so74139946d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=tc5heK0Bq7xtbSCpoIY8pS7rJ6lvO0+nWtiM9i3iwfXSLAE2TU3KZvjO3GXcrwNg1e
         lzGn9mliUa7BvexuUYFJDoNM2Gj8De1dpQOJj5zd83IXppLxRD/WOr0vFd9Ne9dczmjg
         n1xMPM/QIM/lUqTEdtlxzr+omCChRjOhGN4eMBgZnuwIq4WiSuCrBZaMw6vSr70dzP7v
         84U7+n7ShDhDjeXf9/NWs0+db001Rb988qfB9XlUDg2rmvYg/cpJhi96q6g5EKH0vpIf
         kmkgQ80CMS+NRRX1nGmD+cB38CXLNXSiKpILOG07N9hC7B0/Q63h7JY3duMsjKtqFZYt
         Akkg==
X-Forwarded-Encrypted: i=1; AJvYcCVrZlUL8wNoXgV3CpDIa7zT3ECrNsZsu1z73IOLQy6ZxhGPzg+EEC+qD3S9dGxwllKD2q8TzlnFa81MAxk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjDf7NjXovv7L6G7jNYaKwRvi3iaEIeUzu/qOw/sxkrcaZdK1h
	LxtWEj4sjCUtO/KuyN162UGx8Z/ZiQFG5v936ZieBAg1iosoPbk3hQe4R4SA8mdn0Cke3xsMMXY
	mcsZqRDymlQaBfUFhTV+3RA3lGe4dAur//zU2IkZnkNKw3qyz93DzkwXD99HyN13WZ2lV
X-Gm-Gg: ASbGnct6bRENns+dnZXdARQ7GPeRy+84thkCiJWEG7VWTq64kl7Ng2GZ71QAmojhohT
	tFUI1mzplABDE77/fkMu6ijnUc+L0yAApFCmMwPvFbccxuMoACYRrVt0f6lcxNLDsjWjW0zyLvb
	/pL6ow6fIgzAPw63YVqS/3kgaaC3Opyac1PQWQV82bl60hysqsJfvrzbJKgFeDlNE8qHz1uf2a1
	JvPG7UyRQtuDaeSuU4ZoO/8wuxyXeNQUVr71Aq1P3RTOjcOnP+cSdiSqEscM7tWlzfaO6VXoun3
	pL9laFxoL6BoXpB45b/MUNserSdSweMItnWEYsIEpWoNMSgCUEMTiiLv8clJFePWZj9HZR7zOJ4
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008846d6.23.1748422008977;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Proofpoint-GUID: _R9H6-fDKKuXW-oabBzMXkFH0otH-o70
X-Proofpoint-ORIG-GUID: _R9H6-fDKKuXW-oabBzMXkFH0otH-o70
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfX/VkxHDjmqIVX
 vIDcl8GRrVMYPsRLF1lv0JRT7L/Sto8E4CZQYbFn76NOPu6SH5A69fYFzI72lA5sw/HJM3japd1
 Q0yeivkFkfIL32ET/Vg9VFC2Xs//gqE8/HWT5hiTvV3PsZ7J2InI226wTLkxDv6sA50DJo29DeU
 rFdGwf/Z9PjyfCxBEOJrA9etWZ/EpQj9F3xPyUHmaWOsDNqozbxVWQ7S/hHrn5sr2/6wGaZcsyL
 4xJaWYqG5KZHsqBMaV+/V5vMeiQpRwEDaZ4GTFEsFYB+rsDbphF7KtsdCspmWEokC7pPGfSM9dq
 iMRDpZL/U8J9QcKDTap3a87EU03VRsmYZIihIYpDklhBgy2AQ/LpnjUFDzpTR1ZXYhyOh3k2x4d
 /gxkS9Sz59K5H3RfeNVkbkWcutdPzE+FJpZTK5e17ESFdUw7o/p8orp4kDWLsnjDs+xjw+oy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=496
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280075
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

