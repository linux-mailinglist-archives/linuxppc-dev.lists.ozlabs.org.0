Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FE52148
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 05:40:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XsP735QvzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:40:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XsMS29SxzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 13:38:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P3WKJT019525
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 23:38:41 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbaayu0hw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 23:38:41 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 25 Jun 2019 04:38:39 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 04:38:38 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5P3cbQb49742250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:38:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45521AE062;
 Tue, 25 Jun 2019 03:38:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04CBCAE05C;
 Tue, 25 Jun 2019 03:38:36 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.51])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 03:38:36 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9CD7A4EC62A; Tue, 25 Jun 2019 13:38:33 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc: Document xive=off option
In-Reply-To: <20190513053910.19227-1-mikey@neuling.org>
References: <20190513053910.19227-1-mikey@neuling.org>
Date: Tue, 25 Jun 2019 13:38:33 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19062503-0064-0000-0000-000003F3568D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011324; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01222887; UDB=6.00643503; IPR=6.01004055; 
 MB=3.00027454; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-25 03:38:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062503-0065-0000-0000-00003E058AD4
Message-Id: <875zou9vwm.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=857 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250027
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dri?= =?utf-8?Q?c?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Neuling <mikey@neuling.org> writes:
> commit 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE
> interrupt controller") added an option to turn off Linux native XIVE
> usage via the xive=off kernel command line option.
>
> This documents this option.
>
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Acked-by: Stewart Smith <stewart@linux.ibm.com>

-- 
Stewart Smith
OPAL Architect, IBM.

