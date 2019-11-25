Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 496AF1093A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 19:42:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MG9k2WwnzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 05:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MG7m1QFHzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 05:40:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47MG7j4l6Dz8sXt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 05:40:49 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47MG7j44S8z9sP6; Tue, 26 Nov 2019 05:40:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47MG7j06jTz9sP3
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 05:40:48 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPIc9La015520; Mon, 25 Nov 2019 13:40:45 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wfk3nybx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 13:40:44 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAPIeJOH018102;
 Mon, 25 Nov 2019 18:40:44 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 2wevd6ccq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 18:40:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAPIehYB52625900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 18:40:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C157112063;
 Mon, 25 Nov 2019 18:40:43 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F8B7112061;
 Mon, 25 Nov 2019 18:40:43 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.80.224.141])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 25 Nov 2019 18:40:43 +0000 (GMT)
Subject: Re: [PATCH net 0/4] ibmvnic: Harden device commands and queries
To: Jakub Kicinski <jakub.kicinski@netronome.com>
References: <1574451706-19058-1-git-send-email-tlfalcon@linux.ibm.com>
 <20191123174925.30b73917@cakuba.netronome.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <52660c98-efd6-16e7-e66d-3528e5b32d3d@linux.ibm.com>
Date: Mon, 25 Nov 2019 12:40:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191123174925.30b73917@cakuba.netronome.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_04:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250151
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
Cc: brking@linux.vnet.ibm.com, netdev@vger.kernel.org,
 julietk@linux.vnet.ibm.com, dnbanerg@us.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/23/19 7:49 PM, Jakub Kicinski wrote:
> On Fri, 22 Nov 2019 13:41:42 -0600, Thomas Falcon wrote:
>> This patch series fixes some shortcomings with the current
>> VNIC device command implementation. The first patch fixes
>> the initialization of driver completion structures used
>> for device commands. Additionally, all waits for device
>> commands are bounded with a timeout in the event that the
>> device does not respond or becomes inoperable. Finally,
>> serialize queries to retain the integrity of device return
>> codes.
> I have minor comments on two patches, but also I think it's
> a little late in the release cycle for putting this in net.
>
> Could you target net-next and repost ASAP so it still makes
> it into 5.5?
>
> Thanks.

Thank you, sorry for the late response.  I will make the requested 
changes ASAP, but I've missed the net-next window.  What should I target 
for v2?

Thanks again,

Tom

