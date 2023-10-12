Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726EE7C71EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 17:58:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RUAOaj6r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5vRx215gz3dLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 02:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RUAOaj6r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5vR068Yzz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 02:57:16 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CFt9kN025695;
	Thu, 12 Oct 2023 15:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ej8TpQ95N6lTekPxe11ggSl50qUS3/n1+mBEh7xsjhU=;
 b=RUAOaj6rorP2o8mebuYx/SXohhiR3cFHvLCYCWhoPRxFJBZ3stp3LkU5AG8zl3Qad1oZ
 b/vCsF0+VZdx1i3tONM8p8DCVc/hGmsErV/DMZ+oukA8glIHlDpmOXFZeUVQWqgGNJDC
 83vqNYyruEo+GkdVf5prbBKw+PgSYbaNFFr46oV96+upYZS7ygeAVzw5PAQTJdL+el+x
 IpnN6EefgIE8E3YsdoNQhQOlSOAvfoXebIpPNabVYy0Lc4hLunG07jifVmLxMNAxWdEe
 BdQqWmJv8/eLa/r/T9wgCrCIG3FgEVe6htL3CM00lDal7ChnTavYD6CCsZt7RsihVTVf cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpkv3045c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:57:00 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39CFtp6G030101;
	Thu, 12 Oct 2023 15:56:58 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpkv303ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:56:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39CEh83w023018;
	Thu, 12 Oct 2023 15:56:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc200ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 15:56:52 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CFunhL26280524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 15:56:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DC1920043;
	Thu, 12 Oct 2023 15:56:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A641A20040;
	Thu, 12 Oct 2023 15:56:46 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.59.173])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Oct 2023 15:56:46 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <c59c586e-08ab-df66-7bcd-5249d2481298@arm.com>
Date: Thu, 12 Oct 2023 21:26:34 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C5929B2-96B3-46D5-82ED-ADD6A0CDE97B@linux.vnet.ibm.com>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cj26Dpit3igZjybsbnotBiv_F8mEu62Aor+9bBhwVh55g@mail.gmail.com>
 <c59c586e-08ab-df66-7bcd-5249d2481298@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        "David.Laight@aculab.com" <David.Laight@ACULAB.COM>,
        mike.leach@linaro.org, James Clark <james.clark@arm.com>,
        Namhyung Kim <namhyung@kernel.org>, tianruidong@linux.alibaba.com,
        Leo Yan <leo.yan@linaro.org>, yangtiezhu@loongson.cn
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zl2P6Ie_5iUyV_lY1_s-kxhEZlrwbLPw
X-Proofpoint-GUID: CZZFvB_GP1OlKYBxMVWs8zTjbi9oJVHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120132
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Oct-2023, at 3:06 PM, Suzuki K Poulose <suzuki.poulose@arm.com> =
wrote:
>=20
> On 05/10/2023 06:02, Namhyung Kim wrote:
>> On Thu, Sep 28, 2023 at 9:11=E2=80=AFPM Athira Rajeev
>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Running shellcheck on tests/shell/test_arm_coresight.sh
>>> throws below warnings:
>>>=20
>>>         In tests/shell/test_arm_coresight.sh line 15:
>>>         cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ =
-name cpu* -print -quit)
>>>                   ^--^ SC2061: Quote the parameter to -name so the =
shell won't interpret it.
>>>=20
>>>         In tests/shell/test_arm_coresight.sh line 20:
>>>                 if [ $archhver -eq 5 -a "$(printf "0x%X\n" =
$archpart)" =3D "0xA13" ] ; then
>>>                                      ^-- SC2166: Prefer [ p ] && [ q =
] as [ p -a q ] is not well defined
>>>=20
>>> This warning is observed after commit:
>>> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm =
ETE")"
>>>=20
>>> Fixed this issue by using quoting 'cpu*' for SC2061 and
>>> using "&&" in line number 20 for SC2166 warning
>>>=20
>>> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm =
ETE")
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Thanks for the fix.
>=20
> Nothing to do with this patch, but I am wondering if the original =
patch
> is over engineered and may not be future proof.
>=20
> e.g.,
>=20
> cs_etm_dev_name() {
> + cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ -name =
cpu* -print -quit)
>=20
> Right there you got the device name and we can easily deduce the name =
of
> the "ETM" node.
>=20
> e.g,:
> etm=3D$(basename $(readlink cs_etm_path) | sed "s/[0-9]\+$//")
>=20
> And practically, nobody prevents an ETE mixed with an ETM on a =
"hybrid"
> system (hopefully, no one builds it ;-))
>=20
> Also, instead of hardcoding "ete" and "etm" prefixes from the arch =
part,
> we should simply use the cpu nodes from :
>=20
> /sys/bus/event_source/devices/cs_etm/
>=20
> e.g.,
>=20
> arm_cs_etm_traverse_path_test() {
> # Iterate for every ETM device
> for c in /sys/bus/event_source/devices/cs_etm/cpu*; do
> # Read the link to be on the safer side
> dev=3D`readlink $c`
>=20
> # Find the ETM device belonging to which CPU
> cpu=3D`cat $dev/cpu`
>=20
> # Use depth-first search (DFS) to iterate outputs
> arm_cs_iterate_devices $dev $cpu
> done;
> }
>=20
>=20
>=20
>> You'd better add Coresight folks on this.
>> Maybe this file was missing in the MAINTAINERS file.
>=20
> And the original author of the commit, that introduced the issue too.
>=20
> Suzuki

Hi All,
Thanks for the discussion and feedbacks.

This patch fixes the shellcheck warning introduced in function =
"cs_etm_dev_name". But with the changes that Suzuki suggested, we won't =
need the function "cs_etm_dev_name" since the code will use =
"/sys/bus/event_source/devices/cs_etm/" .  In that case, can I drop this =
patch for now from this series ?

Thanks
Athira

>=20
>> Thanks,
>> Namhyung
>>> ---
>>>  tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh =
b/tools/perf/tests/shell/test_arm_coresight.sh
>>> index fe78c4626e45..f2115dfa24a5 100755
>>> --- a/tools/perf/tests/shell/test_arm_coresight.sh
>>> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
>>> @@ -12,12 +12,12 @@
>>>  glb_err=3D0
>>>=20
>>>  cs_etm_dev_name() {
>>> -       cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ =
-name cpu* -print -quit)
>>> +       cs_etm_path=3D$(find  /sys/bus/event_source/devices/cs_etm/ =
-name 'cpu*' -print -quit)
>>>         trcdevarch=3D$(cat ${cs_etm_path}/mgmt/trcdevarch)
>>>         archhver=3D$((($trcdevarch >> 12) & 0xf))
>>>         archpart=3D$(($trcdevarch & 0xfff))
>>>=20
>>> -       if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" =3D =
"0xA13" ] ; then
>>> +       if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" =3D=
 "0xA13" ] ; then
>>>                 echo "ete"
>>>         else
>>>                 echo "etm"
>>> --
>>> 2.31.1


