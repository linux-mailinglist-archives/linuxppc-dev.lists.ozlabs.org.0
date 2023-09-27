Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701D7AF735
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 02:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwHGZ1Vb6z3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 10:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwHG20tF2z30P3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 10:16:08 +1000 (AEST)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-79faba5fe12so261761039f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 17:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695773766; x=1696378566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1iZ4LU82UOG96j2VBk+9ry3Jk5SAeQvNprBdriKjWE=;
        b=hY6kVlrHK6LaE6Pw1NTqr0Sd2ZNz/aSemsC/nUEbCSDOtKgX39jiO+OIxqJOApe9Ew
         pLMd3Ba+JhZXf9wYQ2Kbu63vj6n2y8RUvvHvwbra8YQpBJxK6bjJMmRVLQenp7t+klSW
         bfBw6mm/A+Hsc2ERvStEp4Y2To3rhzYVrmyTuGDRZ0XjRbUoeMh3BtS9iyUo64GIo0ZJ
         +cN2uB/6XQysQELNGOJvXd5/hGZwhuK1LCF232Rdvfvs/o9xMYPlwIzRqFjxXJ5Ga3Gn
         X7bkUykAzw9TARYskeaXN3/QcE7shCMB5PDfXAexVWJMfQT2p9VueIr3cTnpc9ROmYc9
         ubNw==
X-Gm-Message-State: AOJu0YwF46z6agSlt4hWmx2q4BvjLxjns0bypANkBWebNi8G6Gsmvc95
	CaEhgOB4MIVSuDIh5nKaKguak/gaLdb38FmcKbY=
X-Google-Smtp-Source: AGHT+IHjC5UMNeuTMvB33Sbl+4uRFJJxkKraQqgF0oif/NziwbXElCwaGRmlMkcuh/j1vmapPbBvGvFi6qT5WD8VFXQ=
X-Received: by 2002:a6b:e211:0:b0:78b:b892:e334 with SMTP id
 z17-20020a6be211000000b0078bb892e334mr441916ioc.11.1695773766267; Tue, 26 Sep
 2023 17:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230915053752.3012-1-atrajeev@linux.vnet.ibm.com> <20230915053752.3012-2-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230915053752.3012-2-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 26 Sep 2023 17:15:54 -0700
Message-ID: <CAM9d7cg+RcpXnhB7ZBzsUXKuXXd_nTfnFNMf9L_+LNm8i1d47g@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 10:40=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> The testcase "Object code reading" fails in somecases
> for "fs_something" sub test as below:
>
>     Reading object code for memory address: 0xc008000007f0142c
>     File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     On file address is: 0x1114cc
>     Objdump command is: objdump -z -d --start-address=3D0x11142c --stop-a=
ddress=3D0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     objdump read too few bytes: 128
>     test child finished with -1
>
> This can alo be reproduced when running perf record with
> workload that exercises fs_something() code. In the test
> setup, this is exercising xfs code since root is xfs.
>
>     # perf record ./a.out
>     # perf report -v |grep "xfs.ko"
>       0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000=
007de5efc B [k] xlog_cil_commit
>       0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc00800=
0007d5ae18 B [k] xfs_btree_key_offset
>       0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc00800=
0007e11fd4 B [k] 0x0000000000112074
>
> Here addr "0xc008000007e11fd4" is not resolved. since this is a
> kernel module, its offset is from the DSO. Xfs module is loaded
> at 0xc008000007d00000
>
>    # cat /proc/modules | grep xfs
>     xfs 2228224 3 - Live 0xc008000007d00000
>
> And size is 0x220000. So its loaded between  0xc008000007d00000
> and 0xc008000007f20000. From objdump, text section is:
>     text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
>
> Hence perf captured ip maps to 0x112074 which is:
> ( ip - start of module ) + a0
>
> This offset 0x112074 falls out .text section which is up to 0x10f7bc
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
>
> To address this issue in "object code reading", skip the sample if
> address falls out of text section and is within the module end.
> Use the "text_end" member of "struct dso" to do this check.
>
> To address this issue in "perf report", exploring an option of
> having stubs range as part of the /proc/kallsyms, so that perf
> report can resolve addresses in stubs range
>
> However this patch uses text_end to skip the stub range for
> Object code reading testcase.
>
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Tested-by: Disha Goel<disgoel@linux.ibm.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> Changelog:
>  v3 -> v4:
>  Fixed indent in V3
>
>  v2 -> v3:
>  Used strtailcmp in comparison for module check and added Reviewed-by
>  from Adrian, Tested-by from Disha.
>
>  v1 -> v2:
>  Updated comment to add description on which arch has stub and
>  reason for skipping as suggested by Adrian
>
>  tools/perf/tests/code-reading.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-read=
ing.c
> index ed3815163d1b..9e6e6c985840 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -269,6 +269,16 @@ static int read_object_code(u64 addr, size_t len, u8=
 cpumode,
>         if (addr + len > map__end(al.map))
>                 len =3D map__end(al.map) - addr;
>
> +       /*
> +        * Some architectures (ex: powerpc) have stubs (trampolines) in k=
ernel
> +        * modules to manage long jumps. Check if the ip offset falls in =
stubs
> +        * sections for kernel modules. And skip module address after tex=
t end
> +        */
> +       if (!strtailcmp(dso->long_name, ".ko") && al.addr > dso->text_end=
) {

There's a is_kernel_module() that can check compressed modules
too but I think we need a simpler way to check it like dso->kernel.

Thanks,
Namhyung


> +               pr_debug("skipping the module address %#"PRIx64" after te=
xt end\n", al.addr);
> +               goto out;
> +       }
> +
>         /* Read the object code using perf */
>         ret_len =3D dso__data_read_offset(dso, maps__machine(thread__maps=
(thread)),
>                                         al.addr, buf1, len);
> --
> 2.31.1
>
