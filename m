Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B97AF94A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 06:24:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZK16hjTb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwNmn0wmcz3cbZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 14:24:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZK16hjTb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwNlr6Dv0z3cCT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 14:23:51 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38R4CACm009650;
	Wed, 27 Sep 2023 04:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=96kntCIhU0ieiIvyjO4Yq8fdY2jKAFVRR8HUypWX/Hw=;
 b=ZK16hjTb9I5iXxH2T/XbGkePHkiJ2APoKsVEovnaLpNMkAj+vxa0yW2es/kftxfaM2NH
 3QjxGmi4yUwGmXMXLXSYVJKSvNWEvT0jWETFXPkWLjCC9EaFIISxsujlTZ4wv9l59tvU
 ZGYGOE20WT0YNJ2Ou++LdlVfLVwEnD6bVn1RX7gYIzhJkiafrSmHBcKOnKkMdhERLOu9
 ZQ84wH2QmWmXbnLCfj2nNjZourM6JFUHB7xyTaKCvTh+6Dzl/Ew+xbUfX/Z5gs/4Fg3q
 6jOwKRQaCVDAvYHaE0FaxhbB0P6SKIJrCEvKfNm0kCzLd2r3s7vktIautrEq+Kp1otJc jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcd5bg6m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:23:41 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38R4E71w014040;
	Wed, 27 Sep 2023 04:23:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcd5bg6ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:23:41 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38R3sP9T010995;
	Wed, 27 Sep 2023 04:23:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tabukgf3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 04:23:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38R4Nb1C22545040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Sep 2023 04:23:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A0CD20043;
	Wed, 27 Sep 2023 04:23:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43EA320040;
	Wed, 27 Sep 2023 04:23:31 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.105.243])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Sep 2023 04:23:30 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 1/2] tools/perf: Add new CONFIG_SHELLCHECK for detecting
 shellcheck binary
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAM9d7chpQ-t72+wsv0qrLsLK9yJ5x77qapqN3+9tKHqT8246Ew@mail.gmail.com>
Date: Wed, 27 Sep 2023 09:53:17 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <51AB9EEE-6A09-460E-8812-5698FC1300D4@linux.vnet.ibm.com>
References: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
 <CAM9d7chpQ-t72+wsv0qrLsLK9yJ5x77qapqN3+9tKHqT8246Ew@mail.gmail.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fZB-Ca4XwYY-hbCrp0cX2pnZWMellasy
X-Proofpoint-ORIG-GUID: JpfHDvc5Dt6rkd58CTO66yvZFlLQ0-8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_19,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270032
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 27-Sep-2023, at 5:21 AM, Namhyung Kim <namhyung@kernel.org> wrote:
>=20
> Hello,
>=20
> On Thu, Sep 14, 2023 at 10:18=E2=80=AFAM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> shellcheck tool can detect coding/formatting issues on
>> shell scripts. In perf directory "tests/shell", there are lot
>> of shell test scripts and this tool can detect coding/formatting
>> issues on these scripts.
>>=20
>> Example to use shellcheck for severity level for
>> errors and warnings, below command is used:
>>=20
>>   # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do =
shellcheck -S warning $F; done
>>   # echo $?
>>     0
>>=20
>> This testing needs to be automated into the build so that it
>> can avoid regressions and also run the check for newly added
>> during build test itself. Add a new feature check to detect
>> presence of shellcheck. Add CONFIG_SHELLCHECK feature check in
>> the build to avoid not having shellcheck breaking the build.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/build/Makefile.feature |  6 ++++--
>> tools/build/feature/Makefile |  8 +++++++-
>> tools/perf/Makefile.config   | 10 ++++++++++
>> 3 files changed, 21 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/tools/build/Makefile.feature =
b/tools/build/Makefile.feature
>> index 934e2777a2db..23f56b95babf 100644
>> --- a/tools/build/Makefile.feature
>> +++ b/tools/build/Makefile.feature
>> @@ -72,7 +72,8 @@ FEATURE_TESTS_BASIC :=3D                  \
>>         libzstd                                \
>>         disassembler-four-args         \
>>         disassembler-init-styled       \
>> -        file-handle
>> +        file-handle                    \
>> +        shellcheck
>>=20
>> # FEATURE_TESTS_BASIC + FEATURE_TESTS_EXTRA is the complete list
>> # of all feature tests
>> @@ -138,7 +139,8 @@ FEATURE_DISPLAY ?=3D              \
>>          get_cpuid              \
>>          bpf                   \
>>          libaio                        \
>> -         libzstd
>> +         libzstd               \
>> +         shellcheck
>>=20
>> #
>> # Declare group members of a feature to display the logical OR of the =
detection
>> diff --git a/tools/build/feature/Makefile =
b/tools/build/feature/Makefile
>> index 3184f387990a..44ba6d0c98d0 100644
>> --- a/tools/build/feature/Makefile
>> +++ b/tools/build/feature/Makefile
>> @@ -76,7 +76,8 @@ FILES=3D                                          \
>>          test-libzstd.bin                      \
>>          test-clang-bpf-co-re.bin              \
>>          test-file-handle.bin                  \
>> -         test-libpfm4.bin
>> +         test-libpfm4.bin                      \
>> +         test-shellcheck.bin
>>=20
>> FILES :=3D $(addprefix $(OUTPUT),$(FILES))
>>=20
>> @@ -92,6 +93,8 @@ __BUILD =3D $(CC) $(CFLAGS) -MD -Wall -Werror -o $@ =
$(patsubst %.bin,%.c,$(@F)) $(
>> __BUILDXX =3D $(CXX) $(CXXFLAGS) -MD -Wall -Werror -o $@ $(patsubst =
%.bin,%.cpp,$(@F)) $(LDFLAGS)
>>   BUILDXX =3D $(__BUILDXX) > $(@:.bin=3D.make.output) 2>&1
>>=20
>> +  BUILD_BINARY =3D sh -c $1 > $(@:.bin=3D.make.output) 2>&1
>> +
>> ###############################
>>=20
>> $(OUTPUT)test-all.bin:
>> @@ -207,6 +210,9 @@ $(OUTPUT)test-libslang-include-subdir.bin:
>> $(OUTPUT)test-libtraceevent.bin:
>>        $(BUILD) -ltraceevent
>>=20
>> +$(OUTPUT)test-shellcheck.bin:
>> +       $(BUILD_BINARY) "shellcheck --version"
>=20
> I don't think it'd generate the .bin file.
>=20
> Anyway, it's a binary file already.  Can we check it with
> `command -v` and get rid of the feature test?
>=20
> Thanks,
> Namhyung

Hi Namhyung,

Thanks for the review. Sure, I will check on this

Athira
>=20
>=20
>> +
>> $(OUTPUT)test-libtracefs.bin:
>>         $(BUILD) $(shell $(PKG_CONFIG) --cflags libtraceevent =
2>/dev/null) -ltracefs
>>=20
>> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
>> index d66b52407e19..e71fe95ad865 100644
>> --- a/tools/perf/Makefile.config
>> +++ b/tools/perf/Makefile.config
>> @@ -779,6 +779,16 @@ ifndef NO_SLANG
>>   endif
>> endif
>>=20
>> +ifneq ($(NO_SHELLCHECK),1)
>> +  $(call feature_check,shellcheck)
>> +  ifneq ($(feature-shellcheck), 1)
>> +    msg :=3D $(warning No shellcheck found. please install =
ShellCheck);
>> +  else
>> +    $(call detected,CONFIG_SHELLCHECK)
>> +    NO_SHELLCHECK :=3D 0
>> +  endif
>> +endif
>> +
>> ifdef GTK2
>>   FLAGS_GTK2=3D$(CFLAGS) $(LDFLAGS) $(EXTLIBS) $(shell $(PKG_CONFIG) =
--libs --cflags gtk+-2.0 2>/dev/null)
>>   $(call feature_check,gtk2)
>> --
>> 2.31.1


