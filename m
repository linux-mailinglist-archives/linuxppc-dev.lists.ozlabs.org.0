Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F314E6016
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 02:15:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470yzV0MGhzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 11:15:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470yxZ4Dg9zDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 11:13:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 470yxY62Hkz8t1l
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 11:13:37 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 470yxY5RvXz9sPZ; Sun, 27 Oct 2019 11:13:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 470yxY1cCLz9sPT
 for <linuxppc-dev@ozlabs.org>; Sun, 27 Oct 2019 11:13:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9R06smI109480
 for <linuxppc-dev@ozlabs.org>; Sat, 26 Oct 2019 20:13:34 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vvfruwhe0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 26 Oct 2019 20:13:33 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Sun, 27 Oct 2019 01:13:32 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 27 Oct 2019 01:13:27 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9R0DPid18350156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Oct 2019 00:13:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A612E4C04A;
 Sun, 27 Oct 2019 00:13:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 720E34C040;
 Sun, 27 Oct 2019 00:13:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.187.251])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 27 Oct 2019 00:13:23 +0000 (GMT)
Subject: Re: [PATCH v9 5/8] ima: make process_buffer_measurement() generic
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Nayna Jain
 <nayna@linux.vnet.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Sat, 26 Oct 2019 20:13:22 -0400
In-Reply-To: <8a97301a-0e25-2718-bd81-d778cb58e1d3@linux.microsoft.com>
References: <20191024034717.70552-1-nayna@linux.ibm.com>
 <20191024034717.70552-6-nayna@linux.ibm.com>
 <1ae56786-4d5c-ba8e-e30c-ced1e15ccb9c@linux.microsoft.com>
 <24cf44d5-a1f0-f59e-9884-c026b1ee2d3b@linux.vnet.ibm.com>
 <8a97301a-0e25-2718-bd81-d778cb58e1d3@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19102700-0020-0000-0000-0000037EF37D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102700-0021-0000-0000-000021D54469
Message-Id: <1572135202.4532.88.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910270000
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Prakhar Srivastava <prsriva02@gmail.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-10-25 at 10:32 -0700, Lakshmi Ramasubramanian wrote:
> 
> On 10/25/2019 10:24 AM, Nayna Jain wrote:
> > 
> > On 10/24/19 10:20 AM, Lakshmi Ramasubramanian wrote:
> >> On 10/23/19 8:47 PM, Nayna Jain wrote:
> >>
> >> Hi Nayna,
> >>
> >>> +void process_buffer_measurement(const void *buf, int size,
> >>> +                const char *eventname, enum ima_hooks func,
> >>> +                int pcr)
> >>>   {
> >>>       int ret = 0;
> >>>       struct ima_template_entry *entry = NULL;
> >>
> >>> +    if (func) {

Let's comment this line.  Perhaps something like /*Unnecessary for
auxiliary buffer measurements */
> >>> +        security_task_getsecid(current, &secid);
> >>> +        action = ima_get_action(NULL, current_cred(), secid, 0, func,
> >>> +                    &pcr, &template);
> >>> +        if (!(action & IMA_MEASURE))
> >>> +            return;
> >>> +    }
> >>
> >> In your change set process_buffer_measurement is called with NONE for 
> >> the parameter func. So ima_get_action (the above if block) will not be 
> >> executed.
> >>
> >> Wouldn't it better to update ima_get_action (and related functions) to 
> >> handle the ima policy (func param)?
> > 
> > 
> > The idea is to use ima-buf template for the auxiliary measurement 
> > record. The auxiliary measurement record is an additional record to the 
> > one already created based on the existing policy. When func is passed as 
> > NONE, it represents it is an additional record. I am not sure what you 
> > mean by updating ima_get_action, it is already handling the ima policy.
> >
> 
> I was referring to using "func" in process_buffer_measurement to 
> determine ima action. In my opinion, process_buffer_measurement should 
> be generic.
> 
> ima_get_action() should instead determine the required ima action, 
> template, pcr, etc. based on "func" passed to it.

Nayna's original patch moved ima_get_action() into the caller, but
that resulted in code duplication in each of the callers.  This
solution differentiates between the initial, which requires calling
ima_get_action(), and auxiliary buffer measurement records.

Mimi 

