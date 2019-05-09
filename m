Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06718524
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 08:11:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4502zh0TBhzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:11:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4502rs0gwLzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 16:05:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4962sN7189988
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 02:05:45 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sccgccuj9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 02:05:45 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Thu, 9 May 2019 07:05:43 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 07:05:39 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4965cCA57344088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 06:05:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C1C311C054;
 Thu,  9 May 2019 06:05:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DE3011C04C;
 Thu,  9 May 2019 06:05:37 +0000 (GMT)
Received: from [9.109.244.72] (unknown [9.109.244.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 May 2019 06:05:37 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_C48C4AE3-3E9E-42EF-A07C-FBF293B2550A"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [next-20190507][powerpc] WARN kernel/cgroup/cgroup.c:6008 with
 LTP ptrace01 test case
Date: Thu, 9 May 2019 11:35:36 +0530
In-Reply-To: <20190508232338.GB1104@tower.DHCP.thefacebook.com>
To: Roman Gushchin <guro@fb.com>
References: <A8995C41-9A8F-468C-89B2-AB6E44C7EADC@linux.vnet.ibm.com>
 <20190508232338.GB1104@tower.DHCP.thefacebook.com>
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19050906-0012-0000-0000-00000319CE2A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050906-0013-0000-0000-0000215252DA
Message-Id: <B292CCEE-B9ED-4227-A6F7-ADAD93011F1A@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=934 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090040
X-Mailman-Approved-At: Thu, 09 May 2019 16:10:37 +1000
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
Cc: Tejun Heo <tj@kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_C48C4AE3-3E9E-42EF-A07C-FBF293B2550A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 09-May-2019, at 4:53 AM, Roman Gushchin <guro@fb.com> wrote:
>=20
> On Wed, May 08, 2019 at 03:06:30PM +0530, Sachin Sant wrote:
>> While running LTP tests(specifically ptrace01) following WARNING is =
observed
>> on POWER8 LPAR running next-20190507 built using 4K page size.
>>=20
>> [ 3969.979492] msgrcv04 (433) used greatest stack depth: 9328 bytes =
left
>> [ 3981.452911] madvise06 (515): drop_caches: 3
>> [ 4004.575752] WARNING: CPU: 5 PID: 721 at =
kernel/cgroup/cgroup.c:6008 cgroup_exit+0x2ac/0x2c0
>> [ 4004.575781] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
>> [ 4004.575837] CPU: 5 PID: 721 Comm: ptrace01 Tainted: G           O  =
    5.1.0-next-20190507-autotest #1
>> [ 4004.575846] NIP:  c000000001b3026c LR: c000000001b30054 CTR: =
c000000001c9f020
>> [ 4004.575855] REGS: c000000171fff840 TRAP: 0700   Tainted: G         =
  O       (5.1.0-next-20190507-autotest)
>> [ 4004.575863] MSR:  800000010282b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44004824  XER: 20000000
>> [ 4004.575885] CFAR: c000000001b30078 IRQMASK: 1=20
>> [ 4004.575885] GPR00: c000000001b30054 c000000171fffad0 =
c000000003938700 c00000027b02fa18=20
>> [ 4004.575885] GPR04: c00000027b02fa00 0000000000000000 =
c000000003ae8700 00000000001c180a=20
>> [ 4004.575885] GPR08: 0000000000000001 0000000000000001 =
c000000003ae8700 0000000000000001=20
>> [ 4004.575885] GPR12: 0000000000004400 c00000001ec7ea80 =
c000000003a4d670 0000000000000009=20
>> [ 4004.575885] GPR16: 0000000000000000 0000000000040100 =
00000000418004fc 0000000008430000=20
>> [ 4004.575885] GPR20: 0000000000000009 0000000000000001 =
c0000001715e9200 c00000016d8f4d00=20
>> [ 4004.575885] GPR24: c000000171fffd90 0000000000000100 =
c000000168692478 c000000171fffb98=20
>> [ 4004.575885] GPR28: c000000168692400 c00000016d8f4d00 =
c0000000036420d0 c00000027b02fa00=20
>> [ 4004.575958] NIP [c000000001b3026c] cgroup_exit+0x2ac/0x2c0
>> [ 4004.575966] LR [c000000001b30054] cgroup_exit+0x94/0x2c0
>> [ 4004.575972] Call Trace:
>> [ 4004.575979] [c000000171fffad0] [c000000001b30054] =
cgroup_exit+0x94/0x2c0 (unreliable)
>> [ 4004.575990] [c000000171fffb30] [c0000000019cea98] =
do_exit+0x878/0x1ae0
>> [ 4004.575999] [c000000171fffc00] [c0000000019cfe4c] =
do_group_exit+0xac/0x1d0
>> [ 4004.576009] [c000000171fffc40] [c0000000019ed00c] =
get_signal+0x2bc/0x11c0
>> [ 4004.576019] [c000000171fffd30] [c000000001867b14] =
do_notify_resume+0x384/0x900
>> [ 4004.576029] [c000000171fffe20] [c00000000183e844] =
ret_from_except_lite+0x70/0x74
>> [ 4004.576037] Instruction dump:
>> [ 4004.576043] 314a0001 7d40492d 40c2fff4 3d42001b e92a7288 39290001 =
f92a7288 4bfffe5c=20
>> [ 4004.576056] 3d42001b e92a7258 39290001 f92a7258 <0fe00000> =
4bfffe0c 4be91e45 60000000=20
>> [ 4004.576071] ---[ end trace 82a1a7c19005ebd6 ]=E2=80=94
>>=20
>> The WARN_ONCE was added by following commit=20
>> 96b9c592def5 ("cgroup: get rid of cgroup_freezer_frozen_exit()=E2=80=9D=
).=20
>>=20
>> Reverting the patch helps avoid the warning.
>=20
> Hi Sachin!
>=20
> Thank you for the report!
>=20
> Can you, please, check that the patch at =
https://lkml.org/lkml/2019/5/8/938 <https://lkml.org/lkml/2019/5/8/938>
> solves the problem?
>=20
This patch fixes the problem for me.

Thanks
-Sachin=

--Apple-Mail=_C48C4AE3-3E9E-42EF-A07C-FBF293B2550A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 09-May-2019, at 4:53 AM, Roman Gushchin &lt;<a =
href=3D"mailto:guro@fb.com" class=3D"">guro@fb.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Wed, May 08, 2019 at =
03:06:30PM +0530, Sachin Sant wrote:</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">While running LTP tests(specifically =
ptrace01) following WARNING is observed<br class=3D"">on POWER8 LPAR =
running next-20190507 built using 4K page size.<br class=3D""><br =
class=3D"">[ 3969.979492] msgrcv04 (433) used greatest stack depth: 9328 =
bytes left<br class=3D"">[ 3981.452911] madvise06 (515): drop_caches: =
3<br class=3D"">[ 4004.575752] WARNING: CPU: 5 PID: 721 at =
kernel/cgroup/cgroup.c:6008 cgroup_exit+0x2ac/0x2c0<br class=3D"">[ =
4004.575781] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]<br class=3D"">[ =
4004.575837] CPU: 5 PID: 721 Comm: ptrace01 Tainted: G =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.1.0-next-20190507-autotest #1<br =
class=3D"">[ 4004.575846] NIP: &nbsp;c000000001b3026c LR: =
c000000001b30054 CTR: c000000001c9f020<br class=3D"">[ 4004.575855] =
REGS: c000000171fff840 TRAP: 0700 &nbsp;&nbsp;Tainted: G =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(5.1.0-next-20190507-autotest)<br =
class=3D"">[ 4004.575863] MSR: &nbsp;800000010282b033 =
&lt;SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]&gt; &nbsp;CR: 44004824 =
&nbsp;XER: 20000000<br class=3D"">[ 4004.575885] CFAR: c000000001b30078 =
IRQMASK: 1<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">[ 4004.575885] GPR00: c000000001b30054 c000000171fffad0 =
c000000003938700 c00000027b02fa18<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">[ =
4004.575885] GPR04: c00000027b02fa00 0000000000000000 c000000003ae8700 =
00000000001c180a<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">[ 4004.575885] GPR08: 0000000000000001 0000000000000001 =
c000000003ae8700 0000000000000001<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">[ =
4004.575885] GPR12: 0000000000004400 c00000001ec7ea80 c000000003a4d670 =
0000000000000009<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">[ 4004.575885] GPR16: 0000000000000000 0000000000040100 =
00000000418004fc 0000000008430000<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">[ =
4004.575885] GPR20: 0000000000000009 0000000000000001 c0000001715e9200 =
c00000016d8f4d00<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">[ 4004.575885] GPR24: c000000171fffd90 0000000000000100 =
c000000168692478 c000000171fffb98<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">[ =
4004.575885] GPR28: c000000168692400 c00000016d8f4d00 c0000000036420d0 =
c00000027b02fa00<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">[ 4004.575958] NIP [c000000001b3026c] =
cgroup_exit+0x2ac/0x2c0<br class=3D"">[ 4004.575966] LR =
[c000000001b30054] cgroup_exit+0x94/0x2c0<br class=3D"">[ 4004.575972] =
Call Trace:<br class=3D"">[ 4004.575979] [c000000171fffad0] =
[c000000001b30054] cgroup_exit+0x94/0x2c0 (unreliable)<br class=3D"">[ =
4004.575990] [c000000171fffb30] [c0000000019cea98] =
do_exit+0x878/0x1ae0<br class=3D"">[ 4004.575999] [c000000171fffc00] =
[c0000000019cfe4c] do_group_exit+0xac/0x1d0<br class=3D"">[ 4004.576009] =
[c000000171fffc40] [c0000000019ed00c] get_signal+0x2bc/0x11c0<br =
class=3D"">[ 4004.576019] [c000000171fffd30] [c000000001867b14] =
do_notify_resume+0x384/0x900<br class=3D"">[ 4004.576029] =
[c000000171fffe20] [c00000000183e844] ret_from_except_lite+0x70/0x74<br =
class=3D"">[ 4004.576037] Instruction dump:<br class=3D"">[ 4004.576043] =
314a0001 7d40492d 40c2fff4 3d42001b e92a7288 39290001 f92a7288 =
4bfffe5c<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">[ 4004.576056] 3d42001b e92a7258 39290001 f92a7258 =
&lt;0fe00000&gt; 4bfffe0c 4be91e45 60000000<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">[ =
4004.576071] ---[ end trace 82a1a7c19005ebd6 ]=E2=80=94<br class=3D""><br =
class=3D"">The WARN_ONCE was added by following commit<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">96b9c592def5 =
("cgroup: get rid of cgroup_freezer_frozen_exit()=E2=80=9D).<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">Reverting the patch helps avoid the warning.<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi Sachin!</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Thank you for the report!</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Can you, please, check that the patch at<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"https://lkml.org/lkml/2019/5/8/938" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://lkml.org/lkml/2019/5/8/938</a><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">solves the problem?</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote>This patch fixes =
the problem for me.</div><div><br =
class=3D""></div><div>Thanks</div><div>-Sachin</div></body></html>=

--Apple-Mail=_C48C4AE3-3E9E-42EF-A07C-FBF293B2550A--

