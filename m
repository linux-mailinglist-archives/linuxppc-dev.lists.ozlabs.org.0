Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C22A5F30F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 08:47:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fT6W3DkNzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 16:46:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fT4m3QczzDqT1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 16:45:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x646gQS4125456
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jul 2019 02:45:25 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2thaw9b49u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 02:45:25 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Thu, 4 Jul 2019 07:45:24 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Jul 2019 07:45:19 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x646jIW138338826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jul 2019 06:45:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3404AC06B;
 Thu,  4 Jul 2019 06:45:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4321AAC05B;
 Thu,  4 Jul 2019 06:45:11 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.146.222])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  4 Jul 2019 06:45:10 +0000 (GMT)
References: <20190628021934.4260-1-bauerman@linux.ibm.com>
 <1561991934.4067.17.camel@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v12 00/11] Appended signatures support for IMA appraisal
In-reply-to: <1561991934.4067.17.camel@linux.ibm.com>
Date: Thu, 04 Jul 2019 03:45:07 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19070406-0064-0000-0000-000003F7088F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011376; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01227188; UDB=6.00646128; IPR=6.01008425; 
 MB=3.00027580; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-04 06:45:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070406-0065-0000-0000-00003E225467
Message-Id: <87k1cyl2mk.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=997 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907040087
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David
 Woodhouse <dwmw2@infradead.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Mimi Zohar <zohar@linux.ibm.com> writes:

> On Thu, 2019-06-27 at 23:19 -0300, Thiago Jung Bauermann wrote:
>> Hello,
>> 
>> This version is essentially identical to the last one.
>> 
>> It is only a rebase on top of today's linux-integrity/next-queued-testing,
>> prompted by conflicts with Prakhar Srivastava's patches to measure the
>> kernel command line. It also drops two patches that are already present in
>> that branch.
>
> Thanks, Thiago.  These patches are now in next-queued-testing waiting
> for some additional reviews/acks.

Thank you very much, Mimi! Now I think I'm only missing acks for the
PKCS#7 changes in patches 2 and 3, and an ack for the s390 changes in
patch 1.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

