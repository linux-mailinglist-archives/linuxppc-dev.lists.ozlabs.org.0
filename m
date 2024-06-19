Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4390F5AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 20:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4BNc0vTVz3dMW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 04:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.46; helo=mail-pj1-f46.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4BN91hTRz30Wb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 04:04:39 +1000 (AEST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c508ea0cc5so87746a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 11:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718820276; x=1719425076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8ZhsocAv7mxK4+EAYdNO5DKRdJ2Di9Hukmg9ZVB8uw=;
        b=X8jsy987e246xK4JLJ2I3ZPN97FE22slX2wYa3bI44YU4CGJBPson80kw0jYjOGTf+
         VVyyW9n6kZZO3fN+TFDD2Yjrv6/XRlm4DetwvnGPOGJtcj8LD2eJa1sFzUOClsYIZUH4
         iNuZP9+4//sEYj7tTb6Q6AoNGgCtPSJrQ4tviuY+Sr8/WqMxW//44qZxeU6s8cYV1YGL
         INOmhMsf4DtYLIO6sDvAhkzpMQ/RD557j81a4TxDSG2lDGv4HatItwHE7MmvFMiV6r13
         pFABXWaJSNlnA/ocBIq3E0+Dv9yLYhOdOXlRFLF3duh6UgP8bZz5wk49NzA1bzDf6f4l
         2eRw==
X-Forwarded-Encrypted: i=1; AJvYcCWV8+y7B8UDLYgfw5G2bgGthbCygF4LswnOF4eox2Czy9Iq09rFcUaz1zOkddSd+mac5AVK0GpE4Qb8IOLnffTWlz2VCZlE+/FGUVR2Wg==
X-Gm-Message-State: AOJu0Yz1ekz0eP32NWj9KA2UMM9bWwO44kmj4uHAQ7NjwSwnvgCX5NiL
	v84Zkp5lyG2iBo9oZa+m6zUZCWO7nxvAMt1ZdkuI8CSSnbY302F3Cn9TrmOdTvjWUkslSLMmnhg
	lwjQ91YVTQEyzTWNr/HmyQ8lcd6I=
X-Google-Smtp-Source: AGHT+IES3BRiSafkq/0FIS7PiugsFIc+I9+nOLDPRn5tQz4oHO2BHLdvXkBXrA3qH1jaaMYOhef/hGRffXHoDq6+Wg0=
X-Received: by 2002:a17:90a:e28e:b0:2c2:f6c1:4d87 with SMTP id
 98e67ed59e1d1-2c7b5cc9ff5mr3310261a91.20.1718820275579; Wed, 19 Jun 2024
 11:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
 <588beeaf-2015-40f4-a34b-e36556e20707@arm.com> <DA51C986-34EE-4849-B9C4-DB69E2ECF75C@linux.vnet.ibm.com>
 <5a0edf86-fe42-41d6-aa9a-8e88c1ad3f4c@arm.com>
In-Reply-To: <5a0edf86-fe42-41d6-aa9a-8e88c1ad3f4c@arm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 19 Jun 2024 14:04:24 -0400
Message-ID: <CAM9d7cj6dRjppQtncwKuu_XhJPv33PKZWG7_kAgBXG9Y0fYH3Q@mail.gmail.com>
Subject: Re: [PATCH] tools/perf: Handle perftool-testsuite_probe testcases
 fail when kernel debuginfo is not present
To: James Clark <james.clark@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Veronika Molnarova <vmolnaro@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Michael Petlan <mpetlan@redhat.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Adding Veronika and Michael to CC.

Thanks,
Namhyung


On Tue, Jun 18, 2024 at 6:44=E2=80=AFAM James Clark <james.clark@arm.com> w=
rote:
>
>
>
> On 17/06/2024 17:47, Athira Rajeev wrote:
> >
> >
> >> On 17 Jun 2024, at 8:30=E2=80=AFPM, James Clark <james.clark@arm.com> =
wrote:
> >>
> >>
> >>
> >> On 17/06/2024 13:21, Athira Rajeev wrote:
> >>> Running "perftool-testsuite_probe" fails as below:
> >>>
> >>> ./perf test -v "perftool-testsuite_probe"
> >>> 83: perftool-testsuite_probe  : FAILED
> >>>
> >>> There are three fails:
> >>>
> >>> 1. Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode=
_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
> >>>   -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added pr=
obe :: perf probe -l (output regexp parsing)
> >>>
> >>
> >> On a machine where NO_DEBUGINFO gets set, this one skips for me. But o=
n
> >> a machine where there _is_ debug info this test still fails.
> >>
> >> But in both cases the probe looks like it was added successfully. So I=
'm
> >> wondering if this one does need to be skipped, or it's just always
> >> failing? Do you have this test passing anywhere where there is debug i=
nfo?
> >>
> >> The list command looks like it successfully lists the probe for me in
> >> both cases, it just doesn't have an address on the end:
> >>
> >> perf list 'probe:*'
> >>
> >>   probe:inode_permission (on inode_permission)
> >>
> >> Does the missing address mean anything or is it just not handled
> >> properly by the test?
> >>
> >> Ironically the machine that _does_ pass the debug info test also print=
s
> >> this, but it looks like it still adds and lists the probe correctly:
> >>
> >>  perf probe -l probe:*
> >>
> >>  Failed to find debug information for address 0xffff80008047ac30
> >>    probe:inode_permission (on inode_permission)
> >
> > Hi James,
> >
> > Thanks for checking this patch.
> >
> > In environment where kernel is compiled with debuginfo:
> >
> > 1) Add probe point
> >
> > # ./perf probe --add inode_permission
> > Added new event:
> >   probe:inode_permission (on inode_permission)
> >
> > You can now use it in all perf tools, such as:
> >
> > perf record -e probe:inode_permission -aR sleep 1
> >
> >
> > 2) Check using perf probe -l
> >
> > # ./perf probe -l
> > probe:inode_permission (on inode_permission:2@fs/namei.c)
> >
> > With debuginfo, the result has additional info.
> >  The test looks for matching pattern "\s*probe:inode_permission(?:_\d+)=
?\s+\(on inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)=E2=80=9D in result
> > where it is expecting "inode_permission:2@fs/namei.c=E2=80=9D . The =E2=
=80=9C@fs/namei.c=E2=80=9D info needs debuginfo here.
> >
>
> Hi Athira,
>
> Maybe there is a real bug and this patch is ok to go in and we should lea=
ve
> it as failing. Probe -L shows there is debug info available for inode_per=
mission:
>
>    $ ./perf probe -L inode_permission
>
>   <inode_permission@linux/fs/namei.c:0>
>       0  int inode_permission(struct mnt_idmap *idmap,
>                              struct inode *inode, int mask)
>   ... more source code ...
>
> But probe -l has an error which could be related to the following
> line not showing the filename details:
>
>   $ ./perf probe -l
>
>   Failed to find debug information for address 0xffff80008047ac30
>     probe:inode_permission (on inode_permission)
>
> I'm running a clang kernel and sometimes I see issues with debug
> info or toolchain stuff, that could be the reason.
>
> > The function I am using in patch to check for debuginfo (skip_if_no_deb=
uginfo) is from "tests/shell/lib/probe_vfs_getname.sh"
> >
> > skip_if_no_debuginfo() {
> >         add_probe_vfs_getname -v 2>&1 | grep -E -q "^(Failed to find th=
e path for the kernel|Debuginfo-analysis is not supported)|(file has no deb=
ug information)" && return 2
> >         return 1
> > }
> >
> > So the debuginfo test passes in your case since the log has "Failed to =
find debug information=E2=80=9D which is not present in above grep string.
> >
>
> It passes because there is debug info for getname_flags() which is what t=
he
> debug info check looks for. After some greps and seds it ultimately does =
this
> which succeeds:
>
>  $ perf probe "vfs_getname=3Dgetname_flags:72 pathname=3Dresult->name:str=
ing"
>
>  Added new event:
>     probe:vfs_getname    (on getname_flags:72 with pathname=3Dresult->nam=
e:string)
>
> "Failed to find debug information for address" is only ever printed
> with "perf probe -l" when there are probes added. The stderr
> of that command is never piped into any grep anyway, which is why I
> see it on the test output.
>
> So "probe -L" is working but "probe -l" isn't. Ultimately it looks like a=
 real
> issue and we should leave the failure in.
>
> > James,
> >
> > Only =E2=80=9Cperf probe -l=E2=80=9D subtest fails with debuginfo enabl=
ed or other two subtests as well? Can you also share result on how other tw=
o subtests behaves ?
> >
> > 1. Fail 2 :
> >    perf probe -nf --max-probes=3D512 -a 'vfs_* $params=E2=80=99
> >
> >
> > 2. Fail 3 :
> >   perf probe 'vfs_read somenonexistingrandomstuffwhichisalsoprettylongo=
revenlongertoexceed64'
> >
>
> Here's the full output:
>
> $ sudo ./perf test -vvv "testsuite_probe"
>  84: perftool-testsuite_probe:
> --- start ---
> test child forked, pid 4872
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_per=
mission ::
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_per=
mission :: -a
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_per=
mission :: --add
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added probe ::=
 perf list
> Failed to find debug information for address 0xffff80008047ac30
> Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode_permis=
sion(?:[:\+][0-9A-Fa-f]+)?@.+\)"
> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added probe ::=
 perf probe -l (output regexp parsing)
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added probe
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added probe
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing removed probe =
(should NOT be listed)
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: adding prob=
e
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes ::=
 first probe adding
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes ::=
 second probe adding (without force)
> Failed to find debug information for address 0xffff80008047ac30
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes ::=
 second probe adding (with force)
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled probe
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing multiple prob=
es
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: wildcard adding suppor=
t
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: non-existing variable
> -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with retval :=
: add
> Regexp not found: "^\[\s+perf\s+record:\s+Woken up [0-9\.]+ times? to wri=
te data\s+\].*$"
> Regexp not found: "^\[\s+perf\s+record:\s+Captured and wrote [0-9\.]+\s*M=
B\s+(?:[\w\+\.-]*(?:(?:[\w\+\.-]+)?(?:\/[\w\+\.-]+)+)?\/)?perf\.data(?:\.\d=
+)?\s*\(~?[0-9\.]+ samples\)\s+\].*$"
> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: function with retval :=
: record (command exitcode + output regexp parsing)
> zero-sized data (/tmp/perftool-testsuite_probe.VMU/perf_probe/perf.data),=
 nothing to do!
> Regexp not found: "\s*cat\s+[0-9\.]+\s+\[[0-9\.]+\]\s+[0-9\.]+:\s+probe:i=
node_permission\w*:\s+\([0-9A-Fa-f]+\s+<\-\s+[0-9A-Fa-f]+\)\s+arg1=3D[0-9A-=
Fa-f]+"
> -- [ FAIL ] -- perf_probe :: test_adding_kernel :: function argument prob=
ing :: script (command exitcode + output regexp parsing)
> ## [ FAIL ] ## perf_probe :: test_adding_kernel SUMMARY :: 3 failures fou=
nd
> ---- end(-1) ----
>  84: perftool-testsuite_probe                                        : FA=
ILED!
>
>
> >
> > Also since you mentioned this gets skipped when debuginfo is not enable=
d, curious to know what is debuginfo message from your setup with debuginfo=
 disabled.
> >
>
>   $ sudo ./perf probe -L getname_flags
>   Failed to find the path for the kernel: Invalid ELF file
>     Error: Failed to show lines.
>
> > Thanks again for checking.
> >
> > Athira
> >
> >>
> >
> >
> >>
> >>> 2. Regexp not found: "probe:vfs_mknod"
> >>>   Regexp not found: "probe:vfs_create"
> >>>   Regexp not found: "probe:vfs_rmdir"
> >>>   Regexp not found: "probe:vfs_link"
> >>>   Regexp not found: "probe:vfs_write"
> >>>   -- [ FAIL ] -- perf_probe :: test_adding_kernel :: wildcard adding =
support (command exitcode + output regexp parsing)
> >>>
> >>> 3. Regexp not found: "Failed to find"
> >>>   Regexp not found: "somenonexistingrandomstuffwhichisalsoprettylongo=
revenlongertoexceed64"
> >>>   Regexp not found: "in this function|at this address"
> >>>   Line did not match any pattern: "The /boot/vmlinux file has no debu=
g information."
> >>>   Line did not match any pattern: "Rebuild with CONFIG_DEBUG_INFO=3Dy=
, or install an appropriate debuginfo package."
> >>>
> >>> These three tests depends on kernel debug info.
> >>> 1. Fail 1 expects file name along with probe which needs debuginfo
> >>> 2. Fail 2 :
> >>>    perf probe -nf --max-probes=3D512 -a 'vfs_* $params'
> >>>    Debuginfo-analysis is not supported.
> >>>     Error: Failed to add events.
> >>>
> >>> 3. Fail 3 :
> >>>   perf probe 'vfs_read somenonexistingrandomstuffwhichisalsoprettylon=
gorevenlongertoexceed64'
> >>>   Debuginfo-analysis is not supported.
> >>>   Error: Failed to add events.
> >>>
> >>> There is already helper function skip_if_no_debuginfo in
> >>> lib/probe_vfs_getname.sh which does perf probe and returns
> >>> "2" if debug info is not present. Use the skip_if_no_debuginfo
> >>> function and skip only the three tests which needs debuginfo
> >>> based on the result.
> >>>
> >>> With the patch:
> >>>
> >>>    83: perftool-testsuite_probe:
> >>>   --- start ---
> >>>   test child forked, pid 3927
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe ino=
de_permission ::
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe ino=
de_permission :: -a
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe ino=
de_permission :: --add
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added pr=
obe :: perf list
> >>>   Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode_=
permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
> >>>   -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due =
to missing debuginfo :: testcase skipped
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added prob=
e
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added p=
robe
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing removed =
probe (should NOT be listed)
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: addin=
g probe
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding pro=
bes :: first probe adding
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding pro=
bes :: second probe adding (without force)
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding pro=
bes :: second probe adding (with force)
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled pr=
obe
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing multipl=
e probes
> >>>   Regexp not found: "probe:vfs_mknod"
> >>>   Regexp not found: "probe:vfs_create"
> >>>   Regexp not found: "probe:vfs_rmdir"
> >>>   Regexp not found: "probe:vfs_link"
> >>>   Regexp not found: "probe:vfs_write"
> >>>   -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due =
to missing debuginfo :: testcase skipped
> >>>   Regexp not found: "Failed to find"
> >>>   Regexp not found: "somenonexistingrandomstuffwhichisalsoprettylongo=
revenlongertoexceed64"
> >>>   Regexp not found: "in this function|at this address"
> >>>   Line did not match any pattern: "The /boot/vmlinux file has no debu=
g information."
> >>>   Line did not match any pattern: "Rebuild with CONFIG_DEBUG_INFO=3Dy=
, or install an appropriate debuginfo package."
> >>>   -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due =
to missing debuginfo :: testcase skipped
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with re=
tval :: add
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with re=
tval :: record
> >>>   -- [ PASS ] -- perf_probe :: test_adding_kernel :: function argumen=
t probing :: script
> >>>   ## [ PASS ] ## perf_probe :: test_adding_kernel SUMMARY
> >>>   ---- end(0) ----
> >>>   83: perftool-testsuite_probe                                       =
 : Ok
> >>>
> >>> Only the three specific tests are skipped and remaining
> >>> ran successfully.
> >>>
> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>> ---
> >>> .../shell/base_probe/test_adding_kernel.sh    | 31 +++++++++++++++++-=
-
> >>> 1 file changed, 28 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh =
b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> >>> index 63bb8974b38e..187dc8d4b163 100755
> >>> --- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> >>> +++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
> >>> @@ -21,8 +21,18 @@
> >>> THIS_TEST_NAME=3D`basename $0 .sh`
> >>> TEST_RESULT=3D0
> >>>
> >>> +# shellcheck source=3Dlib/probe_vfs_getname.sh
> >>> +. "$(dirname "$0")/../lib/probe_vfs_getname.sh"
> >>> +
> >>> TEST_PROBE=3D${TEST_PROBE:-"inode_permission"}
> >>>
> >>> +# set NO_DEBUGINFO to skip testcase if debuginfo is not present
> >>> +# skip_if_no_debuginfo returns 2 if debuginfo is not present
> >>> +skip_if_no_debuginfo
> >>> +if [ $? -eq 2 ]; then
> >>> + NO_DEBUGINFO=3D1
> >>> +fi
> >>> +
> >>> check_kprobes_available
> >>> if [ $? -ne 0 ]; then
> >>> print_overall_skipped
> >>> @@ -67,7 +77,12 @@ PERF_EXIT_CODE=3D$?
> >>> ../common/check_all_patterns_found.pl "\s*probe:${TEST_PROBE}(?:_\d+)=
?\s+\(on ${TEST_PROBE}(?:[:\+]$RE_NUMBER_HEX)?@.+\)" < $LOGS_DIR/adding_ker=
nel_list-l.log
> >>> CHECK_EXIT_CODE=3D$?
> >>>
> >>> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added probe =
:: perf probe -l"
> >>> +if [ $NO_DEBUGINFO ] ; then
> >>> + print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to =
missing debuginfo"
> >>> +else
> >>> + print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added probe=
 :: perf probe -l"
> >>> +fi
> >>> +
> >>> (( TEST_RESULT +=3D $? ))
> >>>
> >>>
> >>> @@ -208,7 +223,12 @@ PERF_EXIT_CODE=3D$?
> >>> ../common/check_all_patterns_found.pl "probe:vfs_mknod" "probe:vfs_cr=
eate" "probe:vfs_rmdir" "probe:vfs_link" "probe:vfs_write" < $LOGS_DIR/addi=
ng_kernel_adding_wildcard.err
> >>> CHECK_EXIT_CODE=3D$?
> >>>
> >>> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding supp=
ort"
> >>> +if [ $NO_DEBUGINFO ] ; then
> >>> + print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to =
missing debuginfo"
> >>> +else
> >>> + print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding sup=
port"
> >>> +fi
> >>> +
> >>> (( TEST_RESULT +=3D $? ))
> >>>
> >>>
> >>> @@ -232,7 +252,12 @@ CHECK_EXIT_CODE=3D$?
> >>> ../common/check_no_patterns_found.pl "$RE_SEGFAULT" < $LOGS_DIR/addin=
g_kernel_nonexisting.err
> >>> (( CHECK_EXIT_CODE +=3D $? ))
> >>>
> >>> -print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing variabl=
e"
> >>> +if [ $NO_DEBUGINFO ]; then
> >>> + print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to =
missing debuginfo"
> >>> +else
> >>> + print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing variab=
le"
> >>> +fi
> >>> +
> >>> (( TEST_RESULT +=3D $? ))
> >>>
> >>>
> >
