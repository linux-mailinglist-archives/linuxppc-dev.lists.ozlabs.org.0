Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF41749E1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 23:53:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VMBh1LM2zDrBh
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 09:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VM965tB7zDrB1
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 09:51:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01TMoXDu101206
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 17:51:51 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmq86q55-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 17:51:51 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 29 Feb 2020 22:51:49 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Feb 2020 22:51:47 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01TMpj7M57344000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 22:51:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B39852054;
 Sat, 29 Feb 2020 22:51:45 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.192.224])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 8B5285204E;
 Sat, 29 Feb 2020 22:51:43 +0000 (GMT)
Date: Sat, 29 Feb 2020 14:51:40 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <1e28fb80-7bae-8d80-1a72-f616af030aab@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e28fb80-7bae-8d80-1a72-f616af030aab@kaod.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20022922-0012-0000-0000-0000038B8C85
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022922-0013-0000-0000-000021C83BEC
Message-Id: <20200229225140.GA5618@oc0525413822.ibm.com>
Subject: RE: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_09:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002290177
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, clg@fr.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 29, 2020 at 09:27:54AM +0100, Cédric Le Goater wrote:
> On 2/29/20 8:54 AM, Ram Pai wrote:
> > XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.
> > 
> > Hence Secure VM, must always default to XICS interrupt controller.
> 
> have you tried XIVE emulation 'kernel-irqchip=off' ? 

yes and it hangs. I think that option, continues to enable some variant
of XIVE in the VM.  There are some known deficiencies between KVM
and the ultravisor negotiation, resulting in a hang in the SVM.

> 
> > If XIVE is requested through kernel command line option "xive=on",
> > override and turn it off.
> 
> This is incorrect. It is negotiated through CAS depending on the FW
> capabilities and the KVM capabilities.

Yes I understand, qemu/KVM have predetermined a set of capabilties that
it can offer to the VM.  The kernel within the VM has a list of
capabilties it needs to operate correctly.  So both negotiate and
determine something mutually ammicable.

Here I am talking about the list of capabilities that the kernel is
trying to determine, it needs to operate correctly.  "xive=on" is one of
those capabilities the kernel is told by the VM-adminstrator, to enable.
Unfortunately if the VM-administrtor blindly requests to enable it, the
kernel must override it, if it knows that will be switching the VM into
a SVM soon. No point negotiating a capability with Qemu; through CAS,
if it knows it cannot handle that capability.

> 
> > If XIVE is the only supported platform interrupt controller; specified
> > through qemu option "ic-mode=xive", simply abort. Otherwise default to
> > XICS.
> 
> 
> I don't think it is a good approach to downgrade the guest kernel 
> capabilities this way. 
> 
> PAPR has specified the CAS negotiation process for this purpose. It 
> comes in two parts under KVM. First the KVM hypervisor advertises or 
> not a capability to QEMU. The second is the CAS negotiation process 
> between QEMU and the guest OS.

Unfortunately, this is not viable.  At the time the hypervisor
advertises its capabilities to qemu, the hypervisor has no idea whether
that VM will switch into a SVM or not.  The decision to switch into a
SVM is taken by the kernel running in the VM. This happens much later,
after the hypervisor has already conveyed its capabilties to the qemu, and
qemu has than instantiated the VM.

As a result, CAS in prom_init is the only place where this negotiation
can take place.

> 
> The SVM specifications might not be complete yet and if some features 
> are incompatible, I think we should modify the capabilities advertised 
> by the hypervisor : no XIVE in case of SVM. QEMU will automatically 
> use the fallback path and emulate the XIVE device, same as setting 
> 'kernel-irqchip=off'. 

As mentioned above, this would be an excellent approach, if the
Hypervisor was aware of the VM's intent to switch into a SVM.  Neither
the hypervisor knows, nor the qemu.  Only the kernel running within the
VM knows about it.


Do you still think, my approach is wrong?
RP

