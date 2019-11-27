Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9110B82D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 21:40:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NXjH0NFpzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 07:40:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NFfT51MyzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 20:22:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR9MJsx053716
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:22:22 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whhyf9cbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:22:20 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <hbabu@us.ibm.com>;
 Wed, 27 Nov 2019 09:22:02 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Nov 2019 09:21:55 -0000
Received: from us1a3-mail61.a3.dal09.isc4sb.com ([10.142.3.102])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019112709215533-266851 ;
 Wed, 27 Nov 2019 09:21:55 +0000 
MIME-Version: 1.0
In-Reply-To: <20191127082810.GA17097@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
From: "Haren Myneni" <hbabu@us.ibm.com>
Date: Wed, 27 Nov 2019 01:20:36 -0800
References: <1574816607.13250.6.camel@hbabu-laptop>
 <20191127082810.GA17097@infradead.org>
X-KeepSent: 14D260BC:48F4C927-002584BF:00332A80;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Build V852_M2_03302010 March 30, 2010
X-LLNOutbound: False
X-Disclaimed: 22043
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0E2CDFA0AC108f9e8a93df938690918c8FBB0E2CDFA0AC10"
Content-Disposition: inline
x-cbid: 19112709-7279-0000-0000-0000014766FC
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000095
X-IBM-SpamModules-Versions: BY=3.00012174; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01296080; UDB=6.00687879; IPR=6.01078329; 
 MB=3.00029736; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-27 09:22:01
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-27 03:45:32 - 6.00010698
x-cbparentid: 19112709-7280-0000-0000-000011FEC896
Message-Id: <OF14D260BC.48F4C927-ON002584BF.00332A80-882584BF.00335313@notes.na.collabserv.com>
Subject: RE: [PATCH 02/14] Revert "powerpc/powernv: remove the unused
 vas_win_paste_addr and vas_win_id functions"
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com,
 Linuxppc-dev <linuxppc-dev-bounces+hbabu=us.ibm.com@lists.ozlabs.org>,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Haren Myneni <haren@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0__=8FBB0E2CDFA0AC108f9e8a93df938690918c8FBB0E2CDFA0AC10
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



"Linuxppc-dev" <linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org>
wrote on 11/27/2019 12:28:10 AM:
>
> On Tue, Nov 26, 2019 at 05:03:27PM -0800, Haren Myneni wrote:
> >
> > This reverts commit 452d23c0f6bd97f2fd8a9691fee79b76040a0feb.
> >
> > User space send windows (NX GZIP compression) need vas=5Fwin=5Fpaste=5F=
addr()
> > to mmap window paste address and vas=5Fwin=5Fid() to get window ID when
> > window address is given.
>
> Even with your full series applied vas=5Fwin=5Fpaste=5Faddr is entirely
> unused, and vas=5Fwin=5Fid is only used once in the same file it is defin=
ed.

Thanks for the review.
vas=5Fwin=5Fpaste=5Faddr() will be used in NX compression driver and planni=
ng to
post this series soon. Can I add this change later as part of this series?

>
> So instead of this patch you should just open code vas=5Fwin=5Fid in
> init=5Fwinctx=5Ffor=5Ftxwin.
>
> > +static inline u32 encode=5Fpswid(int vasid, int winid)
> > +{
> > +   u32 pswid =3D 0;
> > +
> > +   pswid |=3D vasid << (31 - 7);
> > +   pswid |=3D winid;
> > +
> > +   return pswid;
>
> This can be simplified down to:
>
>    return (u32)winid | (vasid << (31 - 7));
>

--0__=8FBB0E2CDFA0AC108f9e8a93df938690918c8FBB0E2CDFA0AC10
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Linuxppc-dev&quot; &lt;linuxppc-d=
ev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 11/27/2019 12:2=
8:10 AM:</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; On Tue, Nov 26, =
2019 at 05:03:27PM -0800, Haren Myneni wrote:<br>&gt; &gt; <br>&gt; &gt; Th=
is reverts commit 452d23c0f6bd97f2fd8a9691fee79b76040a0feb.<br>&gt; &gt; <b=
r>&gt; &gt; User space send windows (NX GZIP compression) need vas=5Fwin=5F=
paste=5Faddr()<br>&gt; &gt; to mmap window paste address and vas=5Fwin=5Fid=
() to get window ID when<br>&gt; &gt; window address is given.<br>&gt; <br>=
&gt; Even with your full series applied vas=5Fwin=5Fpaste=5Faddr is entirel=
y<br>&gt; unused, and vas=5Fwin=5Fid is only used once in the same file it =
is defined.</font></tt><br><br><tt><font size=3D"2">Thanks for the review. =
</font></tt><br><tt><font size=3D"2">vas=5Fwin=5Fpaste=5Faddr() will be use=
d in NX compression driver and planning to post this series soon. Can I add=
 this change later as part of this series? </font></tt><br><tt><font size=
=3D"2"><br>&gt; <br>&gt; So instead of this patch you should just open code=
 vas=5Fwin=5Fid in<br>&gt; init=5Fwinctx=5Ffor=5Ftxwin.<br>&gt; <br>&gt; &g=
t; +static inline u32 encode=5Fpswid(int vasid, int winid)<br>&gt; &gt; +{<=
br>&gt; &gt; + &nbsp; u32 pswid =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp;=
 pswid |=3D vasid &lt;&lt; (31 - 7);<br>&gt; &gt; + &nbsp; pswid |=3D winid=
;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; return pswid;<br>&gt; <br>&gt; This =
can be simplified down to:<br>&gt; <br>&gt; &nbsp; &nbsp;return (u32)winid =
| (vasid &lt;&lt; (31 - 7));<br>&gt; <br></font></tt><BR>
</body></html>

--0__=8FBB0E2CDFA0AC108f9e8a93df938690918c8FBB0E2CDFA0AC10--

