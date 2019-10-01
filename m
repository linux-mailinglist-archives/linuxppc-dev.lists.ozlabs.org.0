Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391EC3A8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 18:31:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jPsn33cyzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 02:31:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jPqf2r8PzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 02:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jPqf0zjWz8t9t
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 02:29:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jPqf0bdQz9sPJ; Wed,  2 Oct 2019 02:29:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jPqd4kFNz9sDB;
 Wed,  2 Oct 2019 02:29:33 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91GDcPI084473; Tue, 1 Oct 2019 12:29:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc9bgahr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 12:29:13 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91GFibZ104327;
 Tue, 1 Oct 2019 12:29:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc9bgahqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 12:29:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91GQQLN009749;
 Tue, 1 Oct 2019 16:29:11 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 2v9y57m06g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 16:29:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91GT9Vl45351412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 16:29:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C01F2BE053;
 Tue,  1 Oct 2019 16:29:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6EE9BE056;
 Tue,  1 Oct 2019 16:29:06 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.224.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 16:29:06 +0000 (GMT)
Subject: Re: [PATCH v6 1/9] dt-bindings: ibm, secureboot: secure boot specific
 properties for PowerNV
To: Rob Herring <robh@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-2-git-send-email-nayna@linux.ibm.com>
 <20191001133330.GA29810@bogus>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <e0575a28-5bd9-1f5b-c09d-ed86cb715165@linux.vnet.ibm.com>
Date: Tue, 1 Oct 2019 12:29:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191001133330.GA29810@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010140
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver O'Halloran <oohall@gmail.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/01/2019 09:33 AM, Rob Herring wrote:
> On Fri, Sep 27, 2019 at 10:25:52AM -0400, Nayna Jain wrote:
>> PowerNV represents both the firmware and Host OS secureboot state of the
>> system via device tree. This patch adds the documentation to give
>> the definition of the nodes and the properties.
>>
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> ---
>>   .../bindings/powerpc/ibm,secureboot.rst       | 76 ++++++++++++++++
>>   .../devicetree/bindings/powerpc/secvar.rst    | 89 +++++++++++++++++++
>>   2 files changed, 165 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>>   create mode 100644 Documentation/devicetree/bindings/powerpc/secvar.rst
>>
>> diff --git a/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>> new file mode 100644
>> index 000000000000..03d32099d2eb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: GPL-2.0
> Not the right form for reST files.
>
>> +*** NOTE ***
>> +This document is copied from OPAL firmware
>> +(skiboot/doc/device-tree/ibm,secureboot.rst)
> Why copy into the kernel?

Do you mean we do not need the device-tree documentation in the kernel 
when it already exists in the skiboot tree ?

I think I am ok with that. Michael, what do you think ?

Thanks & Regards,
      - Nayna
