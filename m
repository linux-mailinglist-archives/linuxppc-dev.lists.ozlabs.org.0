Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46B428C20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 13:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HScFn6TxFz3c9M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 22:36:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m64R3Ci5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=s1seetee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m64R3Ci5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSYv15FCZz2xXr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 20:50:21 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B9371G021268; 
 Mon, 11 Oct 2021 05:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : references :
 subject : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=ZNtr/F0mC0DiuZPiGR8di1OzuO9B0JUbGvwN0+B0BpQ=;
 b=m64R3Ci5c3D12Ull7d5ETJAiS3UTYnoAQ8yu8Py+1/iz8wYUme3uaZxS9tPfnNLucAG9
 J0/OWM+9h6uim+xhsUcAaSAmXa2bYh2KgbVoGzdYOwok9wqfGnuNa5WbaEPc7Ru1QsGG
 yrPnZ6zkMK3m/eRKnSSuJih81xoJn3BBRjIJVza357HJ/ZyfSorerQDvrD7KP8YKIJa5
 qpJ4Q4BefeHi8b3Me6O+xQvVGJZqjdEZYWzlDps6rLmTSW/s3Ne/nJQv7v0a2sJ4xsdK
 9UGC4NlGS92yMA1xy2KLXDL+2FOSm7z1x/fTo1yggXGPydppTGPLfWwV4G/H3EG5OjQ+ Ag== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bmj9s0vuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 05:50:17 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19B9mglE026884;
 Mon, 11 Oct 2021 09:50:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3bk2qaqqhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 09:50:16 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19B9oElY27984284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 09:50:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B773ABE069;
 Mon, 11 Oct 2021 09:50:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54C42BE05B;
 Mon, 11 Oct 2021 09:50:12 +0000 (GMT)
Received: from oc2388111647.ibm.com (unknown [9.43.77.175])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 09:50:12 +0000 (GMT)
To: clg@kaod.org
References: <20211011070203.99726-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Discard disabled interrupts in
 get_irqchip_state()
From: seeteena <s1seetee@linux.vnet.ibm.com>
Message-ID: <23f69a53-c331-a61f-9d89-04fe824e62f4@linux.vnet.ibm.com>
Date: Mon, 11 Oct 2021 15:20:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211011070203.99726-1-clg@kaod.org>
Content-Type: multipart/alternative;
 boundary="------------B148AF9B352D3061782E8422"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tpbMwjkLIK3ThC8l3zvtEwplJHBeaNSK
X-Proofpoint-ORIG-GUID: tpbMwjkLIK3ThC8l3zvtEwplJHBeaNSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_03,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=774 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110053
X-Mailman-Approved-At: Mon, 11 Oct 2021 22:35:07 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------B148AF9B352D3061782E8422
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: seeteena<s1seetee@linux.vnet.ibm.com>

I have used a KVM guest with a passthrough ethernet adapter and the 
lspci output to identify the adapter.


--------------B148AF9B352D3061782E8422
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-text-html" lang="x-unicode">
      <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
          appleLogo, sans-serif; font-size: 15px; font-style: normal;
          font-variant-ligatures: common-ligatures; font-variant-caps:
          normal; font-weight: 400; letter-spacing: normal; orphans: 2;
          text-align: left; text-indent: 0px; text-transform: none;
          white-space: normal; widows: 2; word-spacing: 0px;
          -webkit-text-stroke-width: 0px; background-color: rgb(248,
          248, 248); text-decoration-style: initial;
          text-decoration-color: initial; display: inline !important;
          float: none;">Tested-by: seeteena<a
            class="moz-txt-link-rfc2396E"
            href="mailto:s1seetee@linux.vnet.ibm.com">&lt;s1seetee@linux.vnet.ibm.com&gt;</a></span></p>
      <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
          appleLogo, sans-serif; font-size: 15px; font-style: normal;
          font-variant-ligatures: common-ligatures; font-variant-caps:
          normal; font-weight: 400; letter-spacing: normal; orphans: 2;
          text-align: left; text-indent: 0px; text-transform: none;
          white-space: normal; widows: 2; word-spacing: 0px;
          -webkit-text-stroke-width: 0px; background-color: rgb(248,
          248, 248); text-decoration-style: initial;
          text-decoration-color: initial; display: inline !important;
          float: none;"><span style="color: rgb(29, 28, 29);
            font-family: Slack-Lato, appleLogo, sans-serif; font-size:
            15px; font-style: normal; font-variant-ligatures:
            common-ligatures; font-variant-caps: normal; font-weight:
            400; letter-spacing: normal; orphans: 2; text-align: left;
            text-indent: 0px; text-transform: none; white-space: normal;
            widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
            0px; background-color: rgb(255, 255, 255);
            text-decoration-style: initial; text-decoration-color:
            initial; display: inline !important; float: none;">I have
            used a KVM guest with a passthrough ethernet adapter and the
            lspci output to identify the adapter.</span></span></p>
    </div>
  </body>
</html>

--------------B148AF9B352D3061782E8422--

