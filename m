Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC97674EFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 09:07:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NysYM5ZhCz3fKJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:07:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=og2G4XX8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=og2G4XX8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyrSl2DJDz3fCN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 18:18:30 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K788J3023248;
	Fri, 20 Jan 2023 07:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=161nDjPJb+o6gZJz5L+aj8JKn5jZNGbQvDYfZemXTXk=;
 b=og2G4XX8GZsnL+Tu56swQ68TL6Gw6NNxc7W9G9cerZ6X2WdGdxwxHjXiKEU2vIWklOzQ
 M7GWjSZrjgZcWTvQr8GdKMKKxKrmttgEm03eGgWWrYP8XVP80uzyjlv4tmIbZvBH4zU+
 pPmUacC04XKvTpitEdfS0fC57QQowV87UTexBgNH2N2Jf4P02snwMeBDRkH1wJOD/LOY
 nQNW2YavW6/0fCqgUPjYn3I0NUKpyOyUdp2HDeNH7lKYKHtn/uzi4Vl1kmZt3yDqf3gk
 /9yyHz4m0npUqcinIVy0foDU1tV24rSzUQyxcWFLVvoY10q1/VHIeihfA+OanPtGxeeZ /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7p1drdxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:18:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30K7Gms5021484;
	Fri, 20 Jan 2023 07:18:09 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7p1drdxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:18:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JKm6E3006223;
	Fri, 20 Jan 2023 07:18:07 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfqnhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:18:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30K7I2eH19464792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 07:18:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC6132004F;
	Fri, 20 Jan 2023 07:18:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2B7E20077;
	Fri, 20 Jan 2023 07:16:42 +0000 (GMT)
Received: from [9.43.37.86] (unknown [9.43.37.86])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 07:16:42 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------E7ALhyWXbyAoyIAQy0UH4hsY"
Message-ID: <5ceacec3-158a-3b4d-7641-7905d0ac18d1@linux.ibm.com>
Date: Fri, 20 Jan 2023 12:46:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V3] tools/perf/tests: Fix string substitutions in build id
 test
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org
References: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FLEWNmcemmnxO7oYUI5Tvdnw5O1c4V2K
X-Proofpoint-GUID: 2-eHSf9FxMaThl68Q6sfY9VW1pXtZZvL
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301200065
X-Mailman-Approved-At: Fri, 20 Jan 2023 19:02:02 +1100
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
Cc: irogers@google.com, ak@linux.intel.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, David.Laight@ACULAB.COM, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E7ALhyWXbyAoyIAQy0UH4hsY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Environment with /bin/sh
# readlink -f $(which sh)
/bin/dash

Running perf test from tmp.perf/urgent

# ./perf test -v "build id cache operations"
  73: build id cache operations                                       :
--- start ---
test child forked, pid 71063
WARNING: wine not found. PE binaries will not be run.
test binaries: /tmp/perf.ex.SHA1.RNm /tmp/perf.ex.MD5.Flx ./tests/shell/../pe-file.exe
DEBUGINFOD_URLS=
Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.RNm: Ok
build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitution
test child finished with -2
---- end ----

After applying the patch in same environment, error is not seen and test runs fine.

Tested the same patch in bash as well.
# readlink -f $(which sh)
/usr/bin/bash

The test works fine with the changes.

Tested-by: Disha Goel<disgoel@linux.ibm.com>

On 1/19/23 7:57 PM, Athira Rajeev wrote:
> The perf test named “build id cache operations” skips with below
> error on some distros:
>
> <<>>
>   78: build id cache operations                                       :
> test child forked, pid 111101
> WARNING: wine not found. PE binaries will not be run.
> test binaries: /tmp/perf.ex.SHA1.PKz /tmp/perf.ex.MD5.Gt3 ./tests/shell/../pe-file.exe
> DEBUGINFOD_URLS=
> Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.PKz: Ok
> build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
> ./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitution
> test child finished with -2
> build id cache operations: Skip
> <<>>
>
> The test script "tests/shell/buildid.sh" uses some of the
> string substitution ways which are supported in bash, but not in
> "sh" or other shells. Above error on line number 69 that reports
> "Bad substitution" is:
>
> <<>>
> link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
> <<>>
>
> Here the way of getting first two characters from id ie,
> ${id:0:2} and similarly expressions like ${id:2} is not
> recognised in "sh". So the line errors and instead of
> hitting failure, the test gets skipped as shown in logs.
> So the syntax issue causes test not to be executed in
> such cases. Similarly usage : "${@: -1}" [ to pick last
> argument passed to a function] in “test_record” doesn’t
> work in all distros.
>
> Fix this by using alternative way with shell substitution
> to pick required characters from the string. Also fix the
> usage of “${@: -1}” to work in all cases.
>
> Another usage in “test_record” is:
> <<>>
> ${perf} record --buildid-all -o ${data} $@ &> ${log}
> <<>>
>
> This causes the perf record to start in background and
> Results in the data file not being created by the time
> "check" function is invoked. Below log shows perf record
> result getting displayed after the call to "check" function.
>
> <<>>
> running: perf record /tmp/perf.ex.SHA1.EAU
> build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
> link: /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb
> failed: link /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb does not exist
> test child finished with -1
> build id cache operations: FAILED!
> root@machine:~/athira/linux/tools/perf# Couldn't synthesize bpf events.
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.010 MB /tmp/perf.data.bFF ]
> <<>>
>
> Fix this by redirecting output instead of using “&” which
> starts the command in background.
>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> Acked-by: Ian Rogers<irogers@google.com>
> ---
> Changelog:
>  From v2 -> v3
> - Addressed review comments from David Laight
>    for using shell substitutions.
>
>  From v1 -> v2
> - Added Acked-by from Ian.
> - Rebased to tmp.perf/urgent of:
>   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git
>
>   tools/perf/tests/shell/buildid.sh | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
> index aaf851108ca3..0ce22ea0a7f1 100755
> --- a/tools/perf/tests/shell/buildid.sh
> +++ b/tools/perf/tests/shell/buildid.sh
> @@ -66,7 +66,9 @@ check()
>   	esac
>   	echo "build id: ${id}"
>   
> -	link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
> +	id_file=${id#??}
> +	id_dir=${id%$id_file}
> +	link=$build_id_dir/.build-id/$id_dir/$id_file
>   	echo "link: ${link}" if [ ! -h $link ]; then @@ -74,7 +76,7 @@ check() exit 1 fi - 
> file=${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf + 
> file=${build_id_dir}/.build-id/$id_dir/`readlink ${link}`/elf echo "file: ${file}"
>   
>   	# Check for file permission of original file
> @@ -130,20 +132,22 @@ test_record()
>   {
>   	data=$(mktemp /tmp/perf.data.XXX)
>   	build_id_dir=$(mktemp -d /tmp/perf.debug.XXX)
> -	log=$(mktemp /tmp/perf.log.XXX)
> +	log_out=$(mktemp /tmp/perf.log.out.XXX)
> +	log_err=$(mktemp /tmp/perf.log.err.XXX)
>   	perf="perf --buildid-dir ${build_id_dir}"
>   
>   	echo "running: perf record $@"
> -	${perf} record --buildid-all -o ${data} $@ &> ${log}
> +	${perf} record --buildid-all -o ${data} $@ 1>${log_out} 2>${log_err}
>   	if [ $? -ne 0 ]; then
>   		echo "failed: record $@"
> -		echo "see log: ${log}"
> +		echo "see log: ${log_err}"
>   		exit 1
>   	fi
>   
> -	check ${@: -1}
> +	args="$*"
> +	check ${args##* }
>   
> -	rm -f ${log}
> +	rm -f ${log_out} ${log_err}
>   	rm -rf ${build_id_dir}
>   	rm -rf ${data}
>   }
--------------E7ALhyWXbyAoyIAQy0UH4hsY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Environment with /bin/sh
# readlink -f $(which sh)
/bin/dash

Running perf test from tmp.perf/urgent

# ./perf test -v "build id cache operations"
 73: build id cache operations                                       :
--- start ---
test child forked, pid 71063
WARNING: wine not found. PE binaries will not be run.
test binaries: /tmp/perf.ex.SHA1.RNm /tmp/perf.ex.MD5.Flx ./tests/shell/../pe-file.exe
DEBUGINFOD_URLS=
Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.RNm: Ok
build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitution
test child finished with -2
---- end ----

After applying the patch in same environment, error is not seen and test runs fine.

Tested the same patch in bash as well.
# readlink -f $(which sh)
/usr/bin/bash

The test works fine with the changes.

Tested-by: Disha Goel <a class="moz-txt-link-rfc2396E" href="mailto:disgoel@linux.ibm.com">&lt;disgoel@linux.ibm.com&gt;</a>

</pre>
    <div class="moz-cite-prefix">On 1/19/23 7:57 PM, Athira Rajeev
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230119142719.32628-1-atrajeev@linux.vnet.ibm.com">
      <pre class="moz-quote-pre" wrap="">The perf test named “build id cache operations” skips with below
error on some distros:

&lt;&lt;&gt;&gt;
 78: build id cache operations                                       :
test child forked, pid 111101
WARNING: wine not found. PE binaries will not be run.
test binaries: /tmp/perf.ex.SHA1.PKz /tmp/perf.ex.MD5.Gt3 ./tests/shell/../pe-file.exe
DEBUGINFOD_URLS=
Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.PKz: Ok
build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitution
test child finished with -2
build id cache operations: Skip
&lt;&lt;&gt;&gt;

The test script "tests/shell/buildid.sh" uses some of the
string substitution ways which are supported in bash, but not in
"sh" or other shells. Above error on line number 69 that reports
"Bad substitution" is:

&lt;&lt;&gt;&gt;
link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
&lt;&lt;&gt;&gt;

Here the way of getting first two characters from id ie,
${id:0:2} and similarly expressions like ${id:2} is not
recognised in "sh". So the line errors and instead of
hitting failure, the test gets skipped as shown in logs.
So the syntax issue causes test not to be executed in
such cases. Similarly usage : "${@: -1}" [ to pick last
argument passed to a function] in “test_record” doesn’t
work in all distros.

Fix this by using alternative way with shell substitution
to pick required characters from the string. Also fix the
usage of “${@: -1}” to work in all cases.

Another usage in “test_record” is:
&lt;&lt;&gt;&gt;
${perf} record --buildid-all -o ${data} $@ &amp;&gt; ${log}
&lt;&lt;&gt;&gt;

This causes the perf record to start in background and
Results in the data file not being created by the time
"check" function is invoked. Below log shows perf record
result getting displayed after the call to "check" function.

&lt;&lt;&gt;&gt;
running: perf record /tmp/perf.ex.SHA1.EAU
build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
link: /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb
failed: link /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb does not exist
test child finished with -1
build id cache operations: FAILED!
root@machine:~/athira/linux/tools/perf# Couldn't synthesize bpf events.
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.010 MB /tmp/perf.data.bFF ]
&lt;&lt;&gt;&gt;

Fix this by redirecting output instead of using “&amp;” which
starts the command in background.

Signed-off-by: Athira Rajeev <a class="moz-txt-link-rfc2396E" href="mailto:atrajeev@linux.vnet.ibm.com">&lt;atrajeev@linux.vnet.ibm.com&gt;</a>
Acked-by: Ian Rogers <a class="moz-txt-link-rfc2396E" href="mailto:irogers@google.com">&lt;irogers@google.com&gt;</a>
---
Changelog:
From v2 -&gt; v3
- Addressed review comments from David Laight
  for using shell substitutions.

From v1 -&gt; v2
- Added Acked-by from Ian.
- Rebased to tmp.perf/urgent of:
 git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git

 tools/perf/tests/shell/buildid.sh | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
index aaf851108ca3..0ce22ea0a7f1 100755
--- a/tools/perf/tests/shell/buildid.sh
+++ b/tools/perf/tests/shell/buildid.sh
@@ -66,7 +66,9 @@ check()
 	esac
 	echo "build id: ${id}"
 
-	link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
+	id_file=${id#??}
+	id_dir=${id%$id_file}
+	link=$build_id_dir/.build-id/$id_dir/$id_file
 	echo "link: ${link}<a class="moz-txt-link-rfc2396E" href="mailto:if[!-h$link];then@@-74,7+76,7@@check()exit1fi-file=${build_id_dir}/.build-id/${id:0:2}/`readlink${link}`/elf+file=${build_id_dir}/.build-id/$id_dir/`readlink${link}`/elfecho">"
 
 	if [ ! -h $link ]; then
@@ -74,7 +76,7 @@ check()
 		exit 1
 	fi
 
-	file=${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
+	file=${build_id_dir}/.build-id/$id_dir/`readlink ${link}`/elf
 	echo "</a>file: ${file}"
 
 	# Check for file permission of original file
@@ -130,20 +132,22 @@ test_record()
 {
 	data=$(mktemp /tmp/perf.data.XXX)
 	build_id_dir=$(mktemp -d /tmp/perf.debug.XXX)
-	log=$(mktemp /tmp/perf.log.XXX)
+	log_out=$(mktemp /tmp/perf.log.out.XXX)
+	log_err=$(mktemp /tmp/perf.log.err.XXX)
 	perf="perf --buildid-dir ${build_id_dir}"
 
 	echo "running: perf record $@"
-	${perf} record --buildid-all -o ${data} $@ &amp;&gt; ${log}
+	${perf} record --buildid-all -o ${data} $@ 1&gt;${log_out} 2&gt;${log_err}
 	if [ $? -ne 0 ]; then
 		echo "failed: record $@"
-		echo "see log: ${log}"
+		echo "see log: ${log_err}"
 		exit 1
 	fi
 
-	check ${@: -1}
+	args="$*"
+	check ${args##* }
 
-	rm -f ${log}
+	rm -f ${log_out} ${log_err}
 	rm -rf ${build_id_dir}
 	rm -rf ${data}
 }
</pre>
    </blockquote>
  </body>
</html>

--------------E7ALhyWXbyAoyIAQy0UH4hsY--

