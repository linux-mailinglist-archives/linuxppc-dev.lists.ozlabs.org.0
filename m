Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E57B5D69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 00:55:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsF/+a8U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzxBh0hkgz3vsh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 09:55:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KsF/+a8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2058 seconds by postgrey-1.37 at boromir; Tue, 03 Oct 2023 03:47:32 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzn1c0mkcz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 03:47:29 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392DfUlg027347;
	Mon, 2 Oct 2023 16:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4U6I1yGXylUwoYhJHHuq9oq3NNPfZ9+VoPLpLJ7ibnI=;
 b=KsF/+a8U2akYJdmW5doJsr/I51j/zCz0l/Ob9xnFSqzsGzNWRzaYwzy7wQVXQH4WnkCX
 FR4I4WE+DID+Z52T96TUB0WYhMCJPNVyhuVVEsiGFfC2ranbQYWocqL39f6GwGIiUtae
 AFLes8D0LFiBiLc+5V1la63eH5p3bvGfNVXe7BcXPP1J6dLSTZZtOvDFo/MDwOn3kRLp
 PozHZXDEYcWl98g+vHP3zHdFp9v++8UA6jgakVOd+AXC435PtBh4+4dQZ51UIyoir1S4
 EtVAVTfYVLuTlPbiqPRptAh+mdHNfzcvuWr9Ti0atL38FvVhrg8h5ybM27N62PDgsAZ8 9A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3teapeuu3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 16:12:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 392GCEiI001194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Oct 2023 16:12:14 GMT
Received: from [10.111.179.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 2 Oct
 2023 09:12:11 -0700
Message-ID: <5680429a-72fc-4aae-8e92-d6b31aabe205@quicinc.com>
Date: Mon, 2 Oct 2023 09:12:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 3/4] netdev: replace napi_reschedule with
 napi_schedule
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Snook
	<chris.snook@gmail.com>,
        Raju Rangoju <rajur@chelsio.com>,
        Jeroen de Borst
	<jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Douglas Miller
	<dougmill@linux.ibm.com>,
        Nick Child <nnac123@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Haren Myneni
	<haren@linux.ibm.com>,
        Rick Lindsley <ricklind@linux.ibm.com>,
        Dany Madden
	<danymadden@us.ibm.com>,
        Thomas Falcon <tlfalcon@linux.ibm.com>,
        Tariq Toukan
	<tariqt@nvidia.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose
 Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
        Gregory
 Greenman <gregory.greenman@intel.com>,
        Chandrashekar Devegowda
	<chandrashekar.devegowda@intel.com>,
        Intel Corporation <linuxwwan@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun
	<haijun.liu@mediatek.com>,
        M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Loic Poulain
	<loic.poulain@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes
 Berg <johannes@sipsolutions.net>,
        Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei
 Fang <wei.fang@nxp.com>,
        Alex Elder <elder@linaro.org>, Simon Horman
	<horms@kernel.org>,
        Rob Herring <robh@kernel.org>, Bailey Forrest
	<bcf@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Junfeng Guo
	<junfeng.guo@intel.com>,
        Ziwei Xiao <ziweixiao@google.com>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Rushil Gupta <rushilg@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Yuri
 Karpov <YKarpov@ispras.ru>,
        Zhengchao Shao <shaozhengchao@huawei.com>,
        Andrew
 Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
        "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones <lee@kernel.org>, Dawei Li
	<set_pte_at@outlook.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg
	<benjamin.berg@intel.com>,
        Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
        <linux-rdma@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231002151023.4054-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6kWc5rKZHGshQIEa0G4RBCakTBJKOynB
X-Proofpoint-GUID: 6kWc5rKZHGshQIEa0G4RBCakTBJKOynB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 mlxlogscore=825 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020124
X-Mailman-Approved-At: Tue, 03 Oct 2023 09:51:27 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/2/2023 8:10 AM, Christian Marangi wrote:
> Now that napi_schedule return a bool, we can drop napi_reschedule that
> does the same exact function. The function comes from a very old commit
> bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> net_device") and the purpose is actually deprecated in favour of
> different logic.
> 
> Convert every user of napi_reschedule to napi_schedule.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

For
>   drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

