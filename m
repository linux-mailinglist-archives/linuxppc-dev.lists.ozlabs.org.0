Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A7770D2C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 06:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQLkH3KXRz3cKj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 14:21:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQwLuF65;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQwLuF65;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQFYc1vN2z3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 10:29:07 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N06QDI030404;
	Tue, 23 May 2023 00:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=zxyuYxBUuKgz0Sr4csNLIOjU+M8a1l9lBA+JIWN9Mds=;
 b=bQwLuF654Bac6+VAwWbIGMsW0qi5rH7GEovHTT8y5IszzNHYYJsBKUYI6y1TtfCKZwLK
 OzKeeY/cFlKSBqQdILJNdZF5ZcaouAAp231aWKCH9mrMfEAvlJHCOt8rphLDS3UA96R6
 XLsjl5Y/rmSV6o/YR49qjJcKr6uJtrXyeyCzyj01l85CMp7btcNkIVV+mAYGlZCxVLuz
 o34iUlCP2kMTBcBH9LfOQvTjK1yAaLOqiQIObaUPYm61ALMvVkYyEsHvajxbUhe7Fvex
 hCH22QElfZKAOVaWQ59ASwiTzMh6ZVRIMe+AxKLIAoZL+Th0GacM/U1qlrHRYyHTUdYq Jw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrjfv8nb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 00:28:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34MNXagd015012;
	Tue, 23 May 2023 00:28:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3qppcf10df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 May 2023 00:28:52 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34N0SoLM18875076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 00:28:50 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FBDC20043;
	Tue, 23 May 2023 00:28:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 825DA20040;
	Tue, 23 May 2023 00:28:49 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 May 2023 00:28:49 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B1FB9600BB;
	Tue, 23 May 2023 10:28:45 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
Message-Id: <B7DB5697-89CE-4C9A-BA98-F7F3017BE523@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7B8A09EB-50F3-4FA0-942C-27AD7E6B05F1"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 03/11] asm-generic/mmiowb: Mark accesses to fix KCSAN
 warnings
Date: Tue, 23 May 2023 10:28:35 +1000
In-Reply-To: <20230510033117.1395895-4-rmclure@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-4-rmclure@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RZrtdWdTf1IZDyvluuabf6-uWab24mbk
X-Proofpoint-ORIG-GUID: RZrtdWdTf1IZDyvluuabf6-uWab24mbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220203
X-Mailman-Approved-At: Tue, 23 May 2023 14:21:17 +1000
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
Cc: gautam@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_7B8A09EB-50F3-4FA0-942C-27AD7E6B05F1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
> Prior to this patch, data races are detectable by KCSAN of the =
following
> forms:
>=20
> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt =
context
>    or otherwise outside of a critical section
> [2] Interrupted critical sections, where the interrupt will itself
>    acquire a lock
>=20
> In case [1], calling context does not need an mmiowb() call to be
> issued, otherwise it would do so itself. Such calls to
> mmiowb_set_pending() are either idempotent or no-ops.
>=20
> In case [2], irrespective of when the interrupt occurs, the interrupt
> will acquire and release its locks prior to its return, nesting_count
> will continue balanced. In the worst case, the interrupted critical
> section during a mmiowb_spin_unlock() call observes an mmiowb to be
> pending and afterward is interrupted, leading to an extraneous call to
> mmiowb(). This data race is clearly innocuous.
>=20
> Mark all potentially asynchronous memory accesses with READ_ONCE or
> WRITE_ONCE, including increments and decrements to nesting_count. This
> has the effect of removing KCSAN warnings at consumer's callsites.
>=20
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Gautam Menghani <gautam@linux.ibm.com>
> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: Remove extraneous READ_ONCE in mmiowb_set_pending for =
nesting_count
> ---
> include/asm-generic/mmiowb.h | 14 +++++++++-----
> 1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/asm-generic/mmiowb.h =
b/include/asm-generic/mmiowb.h
> index 5698fca3bf56..6dea28c8835b 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -37,25 +37,29 @@ static inline void mmiowb_set_pending(void)
> 	struct mmiowb_state *ms =3D __mmiowb_state();
>=20
> 	if (likely(ms->nesting_count))
> -		ms->mmiowb_pending =3D ms->nesting_count;
> +		WRITE_ONCE(ms->mmiowb_pending, ms->nesting_count);
> }
>=20
> static inline void mmiowb_spin_lock(void)
> {
> 	struct mmiowb_state *ms =3D __mmiowb_state();
> -	ms->nesting_count++;
> +
> +	/* Increment need not be atomic. Nestedness is balanced over =
interrupts. */
> +	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) + 1);
> }
>=20
> static inline void mmiowb_spin_unlock(void)
> {
> 	struct mmiowb_state *ms =3D __mmiowb_state();
> +	u16 pending =3D READ_ONCE(ms->mmiowb_pending);
>=20
> -	if (unlikely(ms->mmiowb_pending)) {
> -		ms->mmiowb_pending =3D 0;
> +	WRITE_ONCE(ms->mmiowb_pending, 0);
> +	if (unlikely(pending)) {
> 		mmiowb();
> 	}
>=20
> -	ms->nesting_count--;
> +	/* Decrement need not be atomic. Nestedness is balanced over =
interrupts. */
> +	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) - 1);

Still think the nesting_counts don't need WRITE_ONCE/READ_ONCE.
data_race() maybe but I don't know if it's even classed as a data
race. How does KCSAN handle/annotate preempt_count, for example?

Thanks,
Nick=

--Apple-Mail=_7B8A09EB-50F3-4FA0-942C-27AD7E6B05F1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta charset=3D"UTF-8"><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dus-ascii"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; display: inline !important; float: none;">On Wed May 10, 2023 at =
1:31 PM AEST, Rohan McLure wrote:</span><br style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: IBMPlexMono; =
font-size: 16px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">Prior to this patch, data races are detectable =
by KCSAN of the following<br>forms:<br><br>[1] Asynchronous calls to =
mmiowb_set_pending() from an interrupt context<br>&nbsp;&nbsp;&nbsp;or =
otherwise outside of a critical section<br>[2] Interrupted critical =
sections, where the interrupt will itself<br>&nbsp;&nbsp;&nbsp;acquire a =
lock<br><br>In case [1], calling context does not need an mmiowb() call =
to be<br>issued, otherwise it would do so itself. Such calls =
to<br>mmiowb_set_pending() are either idempotent or no-ops.<br><br>In =
case [2], irrespective of when the interrupt occurs, the =
interrupt<br>will acquire and release its locks prior to its return, =
nesting_count<br>will continue balanced. In the worst case, the =
interrupted critical<br>section during a mmiowb_spin_unlock() call =
observes an mmiowb to be<br>pending and afterward is interrupted, =
leading to an extraneous call to<br>mmiowb(). This data race is clearly =
innocuous.<br><br>Mark all potentially asynchronous memory accesses with =
READ_ONCE or<br>WRITE_ONCE, including increments and decrements to =
nesting_count. This<br>has the effect of removing KCSAN warnings at =
consumer's callsites.<br><br>Signed-off-by: Rohan McLure =
&lt;rmclure@linux.ibm.com&gt;<br>Reported-by: Michael Ellerman =
&lt;mpe@ellerman.id.au&gt;<br>Reported-by: Gautam Menghani =
&lt;gautam@linux.ibm.com&gt;<br>Tested-by: Gautam Menghani =
&lt;gautam@linux.ibm.com&gt;<br>Acked-by: Arnd Bergmann =
&lt;arnd@arndb.de&gt;<br>---<br>v2: Remove extraneous READ_ONCE in =
mmiowb_set_pending for =
nesting_count<br>---<br>include/asm-generic/mmiowb.h | 14 =
+++++++++-----<br>1 file changed, 9 insertions(+), 5 =
deletions(-)<br><br>diff --git a/include/asm-generic/mmiowb.h =
b/include/asm-generic/mmiowb.h<br>index 5698fca3bf56..6dea28c8835b =
100644<br>--- a/include/asm-generic/mmiowb.h<br>+++ =
b/include/asm-generic/mmiowb.h<br>@@ -37,25 +37,29 @@ static inline void =
mmiowb_set_pending(void)<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct mmiowb_state *ms =3D =
__mmiowb_state();<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(likely(ms-&gt;nesting_count))<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ms-&gt;mmiowb_pending =3D =
ms-&gt;nesting_count;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>WRITE_ONCE(ms-&gt;mmiowb_pending, =
ms-&gt;nesting_count);<br>}<br><br>static inline void =
mmiowb_spin_lock(void)<br>{<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct mmiowb_state *ms =3D =
__mmiowb_state();<br>-<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span>ms-&gt;nesting_count++;<br>+<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* =
Increment need not be atomic. Nestedness is balanced over interrupts. =
*/<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(ms-&gt;nesting_count, READ_ONCE(ms-&gt;nesting_count) =
+ 1);<br>}<br><br>static inline void =
mmiowb_spin_unlock(void)<br>{<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct mmiowb_state *ms =3D =
__mmiowb_state();<br>+<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span>u16 pending =3D =
READ_ONCE(ms-&gt;mmiowb_pending);<br><br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(unlikely(ms-&gt;mmiowb_pending)) {<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ms-&gt;mmiowb_pending =3D =
0;<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(ms-&gt;mmiowb_pending, 0);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(unlikely(pending)) {<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mmiowb();<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br><br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>ms-&gt;nesting_count--;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Decrement need not be atomic. =
Nestedness is balanced over interrupts. */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(ms-&gt;nesting_count, READ_ONCE(ms-&gt;nesting_count) =
- 1);<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; display: inline !important; float: none;">Still =
think the nesting_counts don't need WRITE_ONCE/READ_ONCE.</span><br =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; display: =
inline !important; float: none;">data_race() maybe but I don't know if =
it's even classed as a data</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; display: inline =
!important; float: none;">race. How does KCSAN handle/annotate =
preempt_count, for example?</span><br style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; display: inline !important; float: =
none;">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: IBMPlexMono; font-size: 16px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; display: inline !important; float: =
none;">Nick</span></body></html>=

--Apple-Mail=_7B8A09EB-50F3-4FA0-942C-27AD7E6B05F1--

