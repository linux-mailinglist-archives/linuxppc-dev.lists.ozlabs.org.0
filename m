Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E57CF048
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 08:45:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e30Oy6DL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9yrs33zpz3cF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 17:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e30Oy6DL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_pbrahma@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9yr10JKBz3c50
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 17:44:31 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J4gl6D022537;
	Thu, 19 Oct 2023 06:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=V8Y7x8UraueFxVKVMqR8JbqzcQQnarTUUx02ADqzL/Q=;
 b=e30Oy6DLdIe/Aqezq0ROiFuOE5DMx3XTllCw/5wAif72a4qv3ZGXqYZmb6N1WVOD7zhu
 lYFEdWOuoDRSXcbj0kyEGLzbBgyNO91gjMFLu9VxpTt742m3012N/ZgxqypL9tvBjr3Q
 VSZWu7/C1KxDQEAGEsrefoPuOPhnaHHpNv7a/pOAt0pvOcemOYz9GaF84pezI0SB1q8g
 Y4jE/p5cpVM5LXHvQZr6JgWoaLE/GgxX22/UZ7fI3NlKWUxPDukJnwW7Xpe21608RJt9
 YD5lNNl4SVQ+QDPllaTGIAXkQA/UiW0ssuMruTgHptbLuBAODGqJppOPb447x0EBQCy7 5w== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt5v839qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 06:44:12 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39J6iBo0008330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 06:44:11 GMT
Received: from [10.214.66.187] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 23:44:06 -0700
Message-ID: <d752e44a-d420-3bb4-e8fc-c8eee7304675@quicinc.com>
Date: Thu, 19 Oct 2023 12:13:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/4] add generic builtin command line
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
References: <20230417162415.GF1391488@zorba>
 <4c420081-fe57-d036-ded7-2899c13738ee@quicinc.com> <ZS6YIjZznHMojNLO@goliath>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <ZS6YIjZznHMojNLO@goliath>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R5ekLEn_H0aCNKQIuq6bDIlWF02rb0tN
X-Proofpoint-ORIG-GUID: R5ekLEn_H0aCNKQIuq6bDIlWF02rb0tN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_05,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=798 lowpriorityscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190057
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
Cc: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, Pavan Kondeti <quic_pkondeti@quicinc.com>, "tomas.mudrunka@gmail.com" <tomas.mudrunka@gmail.com>, quic_vjitta@quicinc.com, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, quic_ylal@quicinc.com, "robh+dt@kernel.org" <robh+dt@kernel.org>, quic_guptap@quicinc.com, "maksym.kokhan@globallogic.com" <maksym.kokhan@globallogic.com>, "dwalker@fifo99.com" <dwalker@fifo99.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 17-10-2023 19:51, Daniel Walker (danielwa) wrote:
> On Tue, Oct 17, 2023 at 04:10:42PM +0530, Pratyush Brahma wrote:
>> For such a usecase, the CONFIG_CMDLINE_PREPEND seems to be quite useful as
>> it would help to stitch bootloader
>> and the desired build variant's configs together. Can you please help to
>> merge this patch?
> Yes, your at least the second person that's asked for it, and it's been on my
> list for some time to release again. I'll try to release it as soon as possible.
>
> Daniel

Thanks Daniel.

Please have this config support for arm64 as well. Previously arm64 used 
to support CONFIG_CMDLINE_EXTEND
which was useful for our usecase. However it was dropped from commit 
cae118b6acc309539b33339e846cbb19187c164c
referring to your patch series as an alternative. Hence the need.

Pratyush
