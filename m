Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5510B8E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 21:48:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NXsx4GwGzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 07:48:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NGc73V2zzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 21:05:26 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARA2WeC120141
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 05:05:24 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whhgcb2mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 05:05:24 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <linuxppc-dev@lists.ozlabs.org> from <hbabu@us.ibm.com>;
 Wed, 27 Nov 2019 10:05:23 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Nov 2019 10:05:17 -0000
Received: from us1a3-mail61.a3.dal09.isc4sb.com ([10.142.3.102])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019112710051663-302533 ;
 Wed, 27 Nov 2019 10:05:16 +0000 
MIME-Version: 1.0
In-Reply-To: <20191127084609.GF17097@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
From: "Haren Myneni" <hbabu@us.ibm.com>
Date: Wed, 27 Nov 2019 02:03:56 -0800
References: <1574817074.13250.16.camel@hbabu-laptop>
 <20191127084609.GF17097@infradead.org>
X-KeepSent: EEBE875A:B646080C-002584BF:00357569;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Build V852_M2_03302010 March 30, 2010
X-LLNOutbound: False
X-Disclaimed: 3319
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0E2CDFA6F3F98f9e8a93df938690918c8FBB0E2CDFA6F3F9"
Content-Disposition: inline
x-cbid: 19112710-6875-0000-0000-0000011D5E5D
X-IBM-SpamModules-Scores: BY=0.070976; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.181053
X-IBM-SpamModules-Versions: BY=3.00012174; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01296094; UDB=6.00687888; IPR=6.01078343; 
 MB=3.00029736; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-27 10:05:21
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-27 04:14:32 - 6.00010698
x-cbparentid: 19112710-6876-0000-0000-000001BFBF93
Message-Id: <OFEEBE875A.B646080C-ON002584BF.00357569-882584BF.00374AF2@notes.na.collabserv.com>
Subject: RE: [PATCH 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
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


--0__=8FBB0E2CDFA6F3F98f9e8a93df938690918c8FBB0E2CDFA6F3F9
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII




"Linuxppc-dev" <linuxppc-dev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org>
wrote on 11/27/2019 12:46:09 AM:
> >
> > +static void notify=5Fprocess(pid=5Ft pid, u64 fault=5Faddr)
> > +{
> > +   int rc;
> > +   struct kernel=5Fsiginfo info;
> > +
> > +   memset(&info, 0, sizeof(info));
> > +
> > +   info.si=5Fsigno =3D SIGSEGV;
> > +   info.si=5Ferrno =3D EFAULT;
> > +   info.si=5Fcode =3D SEGV=5FMAPERR;
> > +
> > +   info.si=5Faddr =3D (void *)fault=5Faddr;
> > +   rcu=5Fread=5Flock();
> > +   rc =3D kill=5Fpid=5Finfo(SIGSEGV, &info, find=5Fvpid(pid));
> > +   rcu=5Fread=5Funlock();
> > +
> > +   pr=5Fdevel("%s(): pid %d kill=5Fproc=5Finfo() rc %d\n", =5F=5Ffunc=
=5F=5F, pid,
rc);
> > +}
>
> Shouldn't this use force=5Fsig=5Ffault=5Fto=5Ftask instead?
>
> > +   /*
> > +    * User space passed invalid CSB address, Notify process with
> > +    * SEGV signal.
> > +    */
> > +   tsk =3D get=5Fpid=5Ftask(window->pid, PIDTYPE=5FPID);
> > +   /*
> > +    * Send window will be closed after processing all NX requests
> > +    * and process exits after closing all windows. In multi-thread
> > +    * applications, thread may not exists, but does not close FD
> > +    * (means send window) upon exit. Parent thread (tgid) can use
> > +    * and close the window later.
> > +    */
> > +   if (tsk) {
> > +      if (tsk->flags & PF=5FEXITING)
> > +         task=5Fexit =3D 1;
> > +      put=5Ftask=5Fstruct(tsk);
> > +      pid =3D vas=5Fwindow=5Fpid(window);
>
> The pid is later used for sending the signal again, why not keep the
> reference?

Sorry, Not dropping the PID reference here, Happens only when window
closed. If the task for this PID is not available, looking for tgid in the
case of multi-thread process.
>
> > +   } else {
> > +      pid =3D vas=5Fwindow=5Ftgid(window);
> > +
> > +      rcu=5Fread=5Flock();
> > +      tsk =3D find=5Ftask=5Fby=5Fvpid(pid);
> > +      if (!tsk) {
> > +         rcu=5Fread=5Funlock();
> > +         return;
> > +      }
> > +      if (tsk->flags & PF=5FEXITING)
> > +         task=5Fexit =3D 1;
> > +      rcu=5Fread=5Funlock();
>
> Why does this not need a reference to the task, but the other one does?

Window is opened with open() and ioctl(fd), will be closed either by close
(fd) explicitly or release FD during process exit.

Process closes all open windows when it exits. So we do not need to keep
the reference for this case. In multi-thread case, child thread can open a
window, but it does not release FD when it exits. Parent thread (tgid) can
continue use this window and closes it upon its exit. So taking reference
to PID in case if this pid is assigned to child thread to make sure its pid
is not reused until window is closed.

We are taking pid reference during window open and releases it when closing
the window.

Thanks
Haren



>

--0__=8FBB0E2CDFA6F3F98f9e8a93df938690918c8FBB0E2CDFA6F3F9
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Linuxppc-dev&quot; &lt;linuxppc-d=
ev-bounces+hbabu=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 11/27/2019 12:4=
6:09 AM:<br>&gt; &gt; &nbsp;<br>&gt; &gt; +static void notify=5Fprocess(pid=
=5Ft pid, u64 fault=5Faddr)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; int rc;<b=
r>&gt; &gt; + &nbsp; struct kernel=5Fsiginfo info;<br>&gt; &gt; +<br>&gt; &=
gt; + &nbsp; memset(&amp;info, 0, sizeof(info));<br>&gt; &gt; +<br>&gt; &gt=
; + &nbsp; info.si=5Fsigno =3D SIGSEGV;<br>&gt; &gt; + &nbsp; info.si=5Ferr=
no =3D EFAULT;<br>&gt; &gt; + &nbsp; info.si=5Fcode =3D SEGV=5FMAPERR;<br>&=
gt; &gt; +<br>&gt; &gt; + &nbsp; info.si=5Faddr =3D (void *)fault=5Faddr;<b=
r>&gt; &gt; + &nbsp; rcu=5Fread=5Flock();<br>&gt; &gt; + &nbsp; rc =3D kill=
=5Fpid=5Finfo(SIGSEGV, &amp;info, find=5Fvpid(pid));<br>&gt; &gt; + &nbsp; =
rcu=5Fread=5Funlock();<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; pr=5Fdevel(&quo=
t;%s(): pid %d kill=5Fproc=5Finfo() rc %d\n&quot;, =5F=5Ffunc=5F=5F, pid, r=
c);<br>&gt; &gt; +}<br>&gt; <br>&gt; Shouldn't this use force=5Fsig=5Ffault=
=5Fto=5Ftask instead?<br>&gt; <br>&gt; &gt; + &nbsp; /*<br>&gt; &gt; + &nbs=
p; &nbsp;* User space passed invalid CSB address, Notify process with<br>&g=
t; &gt; + &nbsp; &nbsp;* SEGV signal.<br>&gt; &gt; + &nbsp; &nbsp;*/<br>&gt=
; &gt; + &nbsp; tsk =3D get=5Fpid=5Ftask(window-&gt;pid, PIDTYPE=5FPID);<br=
>&gt; &gt; + &nbsp; /*<br>&gt; &gt; + &nbsp; &nbsp;* Send window will be cl=
osed after processing all NX requests<br>&gt; &gt; + &nbsp; &nbsp;* and pro=
cess exits after closing all windows. In multi-thread<br>&gt; &gt; + &nbsp;=
 &nbsp;* applications, thread may not exists, but does not close FD<br>&gt;=
 &gt; + &nbsp; &nbsp;* (means send window) upon exit. Parent thread (tgid) =
can use<br>&gt; &gt; + &nbsp; &nbsp;* and close the window later.<br>&gt; &=
gt; + &nbsp; &nbsp;*/<br>&gt; &gt; + &nbsp; if (tsk) {<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp;if (tsk-&gt;flags &amp; PF=5FEXITING)<br>&gt; &gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; task=5Fexit =3D 1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
put=5Ftask=5Fstruct(tsk);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;pid =3D </font=
></tt><tt><font size=3D"2">vas=5Fwindow=5Fpid</font></tt><tt><font size=3D"=
2">(window);<br>&gt; <br>&gt; The pid is later used for sending the signal =
again, why not keep the<br>&gt; reference?</font></tt><br><br><tt><font siz=
e=3D"2">Sorry, Not dropping the PID reference here, Happens only when windo=
w closed. If the task for this PID is not available, looking for tgid in th=
e case of multi-thread process.<br>&gt; <br>&gt; &gt; + &nbsp; } else {<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp;pid =3D vas=5Fwindow=5Ftgid(window);<br>&gt=
; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rcu=5Fread=5Flock();<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp;tsk =3D find=5Ftask=5Fby=5Fvpid(pid);<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp;if (!tsk) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; rcu=5Fread=5Funlock();<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; return=
;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;i=
f (tsk-&gt;flags &amp; PF=5FEXITING)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; task=5Fexit =3D 1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;rcu=5Fread=5Funl=
ock();<br>&gt; <br>&gt; Why does this not need a reference to the task, but=
 the other one does?</font></tt><br><br><tt><font size=3D"2">Window is open=
ed with open() and ioctl(fd), will be closed either by close(fd) explicitly=
 or release FD during process exit. </font></tt><br><br><tt><font size=3D"2=
">Process closes all open windows when it exits. So we do not need to keep =
the reference for this case. In multi-thread case, child thread can open a =
window, but it does not release FD when it exits. Parent thread (tgid) can =
continue use this window and closes it upon its exit. So taking reference t=
o PID in case if this pid is assigned to child thread to make sure its pid =
is not reused until window is closed. </font></tt><br><br><tt><font size=3D=
"2">We are taking pid reference during window open and releases it when clo=
sing the window. </font></tt><br><br><tt><font size=3D"2">Thanks</font></tt=
><br><tt><font size=3D"2">Haren </font></tt><br><br><br><tt><font size=3D"2=
"><br>&gt; <br></font></tt><BR>
</body></html>

--0__=8FBB0E2CDFA6F3F98f9e8a93df938690918c8FBB0E2CDFA6F3F9--

