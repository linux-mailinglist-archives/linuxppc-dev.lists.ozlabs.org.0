Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD9110B88B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 21:44:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NXnY2plszDqPw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 07:44:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbabu@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NG2b50nYzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 20:39:51 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR9b19s092408
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:39:48 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whmsy4h5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:39:47 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <hbabu@us.ibm.com>;
 Wed, 27 Nov 2019 09:39:47 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Nov 2019 09:39:40 -0000
Received: from us1a3-mail61.a3.dal09.isc4sb.com ([10.142.3.102])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019112709393963-287268 ;
 Wed, 27 Nov 2019 09:39:39 +0000 
MIME-Version: 1.0
In-Reply-To: <20191127083055.GB17097@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
From: "Haren Myneni" <hbabu@us.ibm.com>
Date: Wed, 27 Nov 2019 01:38:21 -0800
References: <1574816676.13250.8.camel@hbabu-laptop>
 <20191127083055.GB17097@infradead.org>
X-KeepSent: B64F3C43:62CE1E3C-002584BF:0034DF61;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Build V852_M2_03302010 March 30, 2010
X-LLNOutbound: False
X-Disclaimed: 23291
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0E2CDFA759F18f9e8a93df938690918c8FBB0E2CDFA759F1"
Content-Disposition: inline
x-cbid: 19112709-1335-0000-0000-000002575644
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.028563
X-IBM-SpamModules-Versions: BY=3.00012174; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01296086; UDB=6.00687883; IPR=6.01078335; 
 MB=3.00029736; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-27 09:39:46
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-27 03:19:57 - 6.00010698
x-cbparentid: 19112709-1336-0000-0000-00000F46BD9A
Message-Id: <OFB64F3C43.62CE1E3C-ON002584BF.0034DF61-882584BF.0034F315@notes.na.collabserv.com>
Subject: RE: [PATCH 03/14] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 28 Nov 2019 07:37:20 +1100
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Haren Myneni <haren@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=8FBB0E2CDFA759F18f9e8a93df938690918c8FBB0E2CDFA759F1
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



"Linuxppc-dev" <linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org>
wrote on 11/27/2019 12:30:55 AM:

>
> > +#define crb=5Fcsb=5Faddr(c)      =5F=5Fbe64=5Fto=5Fcpu(c->csb=5Faddr)
> > +#define crb=5Fnx=5Ffault=5Faddr(c)   =5F=5Fbe64=5Fto=5Fcpu
> (c->stamp.nx.fault=5Fstorage=5Faddr)
> > +#define crb=5Fnx=5Fflags(c)      c->stamp.nx.flags
> > +#define crb=5Fnx=5Ffault=5Fstatus(c)   c->stamp.nx.fault=5Fstatus
>
> Except for crb=5Fnx=5Ffault=5Faddr all these macros are unused, and
> crb=5Fnx=5Ffault=5Faddr probably makes more sense open coded in the only
> caller.

Thanks, My mistake, code got changed and forgot to remove unused macros.

>
> Also please don't use the =5F=5F prefixed byte swap helpers in any driver
> or arch code.
>
> > +
> > +static inline uint32=5Ft crb=5Fnx=5Fpswid(struct coprocessor=5Frequest=
=5Fblock
*crb)
> > +{
> > +   return =5F=5Fbe32=5Fto=5Fcpu(crb->stamp.nx.pswid);
> > +}
>
> Same here.  Also not sure what the point of the helper is except for
> obsfucating the code.
>

--0__=8FBB0E2CDFA759F18f9e8a93df938690918c8FBB0E2CDFA759F1
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Linuxppc-dev&quot; &lt;linuxppc-d=
ev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 11/27/2019 12:3=
0:55 AM:<br></font></tt><br><tt><font size=3D"2">&gt; <br>&gt; &gt; +#defin=
e crb=5Fcsb=5Faddr(c) &nbsp; &nbsp; &nbsp;=5F=5Fbe64=5Fto=5Fcpu(c-&gt;csb=
=5Faddr)<br>&gt; &gt; +#define crb=5Fnx=5Ffault=5Faddr(c) &nbsp; =5F=5Fbe64=
=5Fto=5Fcpu<br>&gt; (c-&gt;stamp.nx.fault=5Fstorage=5Faddr)<br>&gt; &gt; +#=
define crb=5Fnx=5Fflags(c) &nbsp; &nbsp; &nbsp;c-&gt;stamp.nx.flags<br>&gt;=
 &gt; +#define crb=5Fnx=5Ffault=5Fstatus(c) &nbsp; c-&gt;stamp.nx.fault=5Fs=
tatus<br>&gt; <br>&gt; Except for crb=5Fnx=5Ffault=5Faddr all these macros =
are unused, and<br>&gt; crb=5Fnx=5Ffault=5Faddr probably makes more sense o=
pen coded in the only<br>&gt; caller.</font></tt><br><br><tt><font size=3D"=
2">Thanks, My mistake, code got changed and forgot to remove unused macros.=
 </font></tt><br><tt><font size=3D"2"><br>&gt; <br>&gt; Also please don't u=
se the =5F=5F prefixed byte swap helpers in any driver<br>&gt; or arch code=
.<br>&gt; <br>&gt; &gt; +<br>&gt; &gt; +static inline uint32=5Ft crb=5Fnx=
=5Fpswid(struct coprocessor=5Frequest=5Fblock *crb)<br>&gt; &gt; +{<br>&gt;=
 &gt; + &nbsp; return =5F=5Fbe32=5Fto=5Fcpu(crb-&gt;stamp.nx.pswid);<br>&gt=
; &gt; +}<br>&gt; <br>&gt; Same here. &nbsp;Also not sure what the point of=
 the helper is except for<br>&gt; obsfucating the code.<br>&gt; <br></font>=
</tt><BR>
</body></html>

--0__=8FBB0E2CDFA759F18f9e8a93df938690918c8FBB0E2CDFA759F1--

