Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A82404961B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 01:53:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SShv1trZzDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 09:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SSg80pfDzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 09:52:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45SSg72bTFz8t0w
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 09:52:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45SSg71vNdz9sP8; Tue, 18 Jun 2019 09:52:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=linuxram@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45SSg65NXrz9sNy
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Jun 2019 09:52:02 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HNlSvD171331
 for <linuxppc-dev@ozlabs.org>; Mon, 17 Jun 2019 19:51:59 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6hd4ef20-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 17 Jun 2019 19:51:59 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 18 Jun 2019 00:51:57 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 00:51:56 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HNps3W51445896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 23:51:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EA34A4053;
 Mon, 17 Jun 2019 23:51:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 733B9A4040;
 Mon, 17 Jun 2019 23:51:50 +0000 (GMT)
Received: from ram.ibm.com (unknown [9.80.224.136])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Jun 2019 23:51:50 +0000 (GMT)
Date: Mon, 17 Jun 2019 16:51:46 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-5-cclaudio@linux.ibm.com>
 <20190617020632.yywfoqwfinjxs3pb@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617020632.yywfoqwfinjxs3pb@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19061723-0012-0000-0000-00000329F815
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061723-0013-0000-0000-00002163118D
Message-Id: <20190617235146.GC10806@ram.ibm.com>
Subject: Re: Re: [PATCH v3 4/9] KVM: PPC: Ultravisor: Add generic ultravisor
 call handler
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170206
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2019 at 12:06:32PM +1000, Paul Mackerras wrote:
> On Thu, Jun 06, 2019 at 02:36:09PM -0300, Claudio Carvalho wrote:
> > From: Ram Pai <linuxram@us.ibm.com>
> > 
> > Add the ucall() function, which can be used to make ultravisor calls
> > with varied number of in and out arguments. Ultravisor calls can be made
> > from the host or guests.
> > 
> > This copies the implementation of plpar_hcall().
> 
> One point which I missed when I looked at this patch previously is
> that the ABI that we're defining here is different from the hcall ABI
> in that we are putting the ucall number in r0, whereas hcalls have the
> hcall number in r3.  That makes ucalls more like syscalls, which have
> the syscall number in r0.  So that last sentence quoted above is
> somewhat misleading.
> 
> The thing we need to consider is that when SMFCTRL[E] = 0, a ucall
> instruction becomes a hcall (that is, sc 2 is executed as if it was
> sc 1).  In that case, the first argument to the ucall will be
> interpreted as the hcall number.  Mostly that will happen not to be a
> valid hcall number, but sometimes it might unavoidably be a valid but
> unintended hcall number.
> 
> I think that will make it difficult to get ucalls to fail gracefully
> in the case where SMF/PEF is disabled.  It seems like the assignment
> of ucall numbers was made so that they wouldn't overlap with valid
> hcall numbers; presumably that was so that we could tell when an hcall
> was actually intended to be a ucall.  However, using a different GPR
> to pass the ucall number defeats that.

Right this is a valid point. Glad that you caught it, otherwise it would
have become a difficult to fix it in the future.

> 
> I realize that there is ultravisor code in development that takes the
> ucall number in r0, and also that having the ucall number in r3 would
> possibly make life more difficult for the place where we call
> UV_RETURN in assembler code.  

Its called from one place in the hypervisor, and the changes look
simple.

-       LOAD_REG_IMMEDIATE(r0, UV_RETURN)
+       LOAD_REG_IMMEDIATE(r3, UV_RETURN)
        ld      r7, VCPU_GPR(R7)(r4)
        ld      r6, VCPU_GPR(R6)(r4)
        ld      r4, VCPU_GPR(R4)(r4)

What am i missing?



> Nevertheless, perhaps we should consider
> changing the ABI to be like the hcall ABI before everything gets set
> in concrete.


yes.

Thanks Paul!
RP

