Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BCAF2A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 23:32:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SdYD4LPRzF1kZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 07:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mdroth@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SdWl0kKszF1XK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 07:31:30 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8ALRHi5172238; Tue, 10 Sep 2019 17:31:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uxhk8v2j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 17:31:21 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8ALV7wn181080;
 Tue, 10 Sep 2019 17:31:21 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uxhk8v2hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 17:31:21 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8ALPxMg030421;
 Tue, 10 Sep 2019 21:31:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 2uv467631a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 21:31:21 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8ALVKul54591860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 21:31:20 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EB6CB2065;
 Tue, 10 Sep 2019 21:31:20 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66591B205F;
 Tue, 10 Sep 2019 21:31:20 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 21:31:20 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <156772568231.16169.9825098672263419233@sif>
References: <20190904222837.25798-1-mdroth@linux.vnet.ibm.com>
 <87pnkfphnz.fsf@mpe.ellerman.id.au>
 <156772568231.16169.9825098672263419233@sif>
Message-ID: <156815107610.3458.14300072385465674142@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH] KVM: PPC: Book3S HV: add smp_mb() in kvmppc_set_host_ipi()
Date: Tue, 10 Sep 2019 16:31:16 -0500
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100204
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Michael Roth (2019-09-05 18:21:22)
> Quoting Michael Ellerman (2019-09-04 22:04:48)
> > That raises the question of whether this needs to be a full barrier or
> > just a write barrier, and where is the matching barrier on the reading
> > side?
> =

> For this particular case I think the same barrier orders it on the
> read-side via kvmppc_set_host_ipi(42, 0) above, but I'm not sure that
> work as a general solution, unless maybe we make that sort of usage
> (clear-before-processing) part of the protocol of using
> kvmppc_set_host_ipi()... it makes sense given we already need to take
> care to not miss clearing them else we get issues like what was fixed
> in 755563bc79c7, which introduced the clear in doorbell_exception(). So
> then it's a matter of additionally making sure we do it prior to
> processing host_ipi state. I haven't looked too closely at the other
> users of kvmppc_set_host_ipi() yet though.

<snip>

> As far as using rw barriers, I can't think of any reason we couldn't, but
> I wouldn't say I'm at all confident in declaring that safe atm...

I think we need a full barrier after all. The following seems possible
otherwise:

      CPU
        X: smp_mb()
        X: ipi_message[RESCHEDULE] =3D 1
        X: kvmppc_set_host_ipi(42, 1)
        X: smp_mb()
        X: doorbell/msgsnd -> 42
       42: doorbell_exception() (from CPU X)
       42: msgsync
       42: kvmppc_set_host_ipi(42, 0) // STORE DEFERRED DUE TO RE-ORDERING
       42: smp_ipi_demux_relaxed()
      105: smb_mb()
      105: ipi_message[CALL_FUNCTION] =3D 1
      105: smp_mb()
      105: kvmppc_set_host_ipi(42, 1)
       42: kvmppc_set_host_ipi(42, 0) // RE-ORDERED STORE COMPLETES
       42: // returns to executing guest
      105: doorbell/msgsnd -> 42
       42: local_paca->kvm_hstate.host_ipi =3D=3D 0 // IPI ignored
      105: // hangs waiting on 42 to process messages/call_single_queue

However that also means the current patch is insufficient, since the
barrier for preventing this scenario needs to come *after* setting
paca_ptrs[cpu]->kvm_hstate.host_ipi to 0.

So I think the right interface is for this is to split
kvmppc_set_host_ipi out into:

static inline void kvmppc_set_host_ipi(int cpu)
{
       smp_mb();
       paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 1;
}

static inline void kvmppc_clear_host_ipi(int cpu)
{
       paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 0;
       smp_mb();
}
