Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 389DB5D236
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:57:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dS5B17NVzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 00:57:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dS305MZ6zDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 00:55:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62Eqq5Y018126
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jul 2019 10:55:19 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tg7fuwqba-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 10:55:19 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <arbab@linux.ibm.com>;
 Tue, 2 Jul 2019 15:55:18 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Jul 2019 15:55:15 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x62EtE6T51839470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jul 2019 14:55:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFBCD124052;
 Tue,  2 Jul 2019 14:55:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1D15124054;
 Tue,  2 Jul 2019 14:55:14 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.85.182.131])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jul 2019 14:55:14 +0000 (GMT)
Received: from arbab-vm (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTP id 406A5100253;
 Tue,  2 Jul 2019 09:55:12 -0500 (CDT)
Date: Tue, 2 Jul 2019 09:55:11 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [v2 03/12] powerpc/mce: Add MCE notification chain
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-4-santosh@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190702051932.511-4-santosh@fossix.org>
Organization: IBM Linux Technology Center
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19070214-0064-0000-0000-000003F62444
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011366; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226410; UDB=6.00645651; IPR=6.01007630; 
 MB=3.00027555; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-02 14:55:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070214-0065-0000-0000-00003E1CB7AB
Message-Id: <20190702145511.lp5vtw3nrysitr3q@arbab-vm>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=566 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020162
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 02, 2019 at 10:49:23AM +0530, Santosh Sivaraj wrote:
>+static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);

Mahesh suggested using an atomic notifier chain instead of blocking, 
since we are in an interrupt.

-- 
Reza Arbab

