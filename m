Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2917E3FB1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 14:08:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zEk9ZeKc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPpSW4t7Vz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 00:08:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zEk9ZeKc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPpRg5M30z3c1B
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 00:07:58 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so3497963a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Nov 2023 05:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699362475; x=1699967275; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VRoxoxM3bk/ddMYA7RkVxhIt7sN32CxDfhJasXbdTQ=;
        b=zEk9ZeKcpZIVQPaJQvJLpc1+wBc6v4axUqcMy+BUfzdudTVJJxjUgzFIUPQfUUsxPL
         HdHqYU7JxAxe6TYeZpyWxAJsHMeImPms1cJ3DXVZf99dFUji+BhNByz9VuNtFcGp6hMB
         F1E6vsTdZ/clpNs5fu6K3Frv7EdHj71QI6HLYqifCNFzCNnBZhmjsm5nDy9F1HSmJB0a
         v5qVsuUM85CinmfxsdK/kRbeykHp3eT62lyltoYvHwEmThPwZp58sTcJvS5jAdjQos8i
         IpCvYJOZzxHUR3TEcQTwAdxB6kNzv1s2RsQ33AKoNZCYGslKYkogQyZd3wZYJ2oPWJ7y
         SWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362475; x=1699967275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VRoxoxM3bk/ddMYA7RkVxhIt7sN32CxDfhJasXbdTQ=;
        b=pdrKLEhSnWDwWvZZJm55QdQScy8ziEd/ru8cSYqXz+jg7TRuzeT4xDZD8MQ25UmR5J
         3+O0YGI6UVVYqfFO7/UeLevPI6STfnIfYcoHqY6Oo0sC/er5T+MuVN2iu55NrnH3Q+3V
         t14QvmWuvnyqjTzcBeSHRQWcnllKxaKQYDjUSYdfEGQTCCfPQMnLzh/P7QZYbXDtZR5E
         b88V6J2Qy0kjTaegml0g3GFK1t8tgvPG6YtVrng3YZI4ls6NLWu1mSUE0GV+tLL00pFa
         cZDJD2mgtuED+r42zToqu20IPZMwTzfRrymOmIld/RPBOQTSFNy/pfPzFHJoyIATEv6b
         ktPA==
X-Gm-Message-State: AOJu0YyBrajelTabVKiisMTyoregtSj5JqMoCQVkW6UIatB21o8w3E/c
	wGCYQ4/ehbaZ6A38nMN9tmH8bD8LnJdzgvcxmjF1XQ==
X-Google-Smtp-Source: AGHT+IEc/OoLKiW5UzIza8k0AJcg/cvGrUiQc/SGatsr9amhK5Gck/VoGoIGcZKiRYhIoVxvQmPBVV/w9nNgSokWHaw=
X-Received: by 2002:a05:6871:3227:b0:1ef:ace4:f360 with SMTP id
 mo39-20020a056871322700b001eface4f360mr2023903oac.17.1699362474620; Tue, 07
 Nov 2023 05:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-33-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-33-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 7 Nov 2023 13:07:18 +0000
Message-ID: <CA+EHjTxMK2G3WSQsjPA5zn94+a91HsoaWXx8tz1TTGuq1tVZ5Q@mail.gmail.com>
Subject: Re: [PATCH 32/34] KVM: selftests: Add basic selftest for guest_memfd()
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@goog
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sun, Nov 5, 2023 at 4:35=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Add a selftest to verify the basic functionality of guest_memfd():
>
> + file descriptor created with the guest_memfd() ioctl does not allow
>   read/write/mmap operations
> + file size and block size as returned from fstat are as expected
> + fallocate on the fd checks that offset/length on
>   fallocate(FALLOC_FL_PUNCH_HOLE) should be page aligned
> + invalid inputs (misaligned size, invalid flags) are rejected
> + file size and inode are unique (the innocuous-sounding
>   anon_inode_getfile() backs all files with a single inode...)
>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Message-Id: <20231027182217.3615211-35-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../testing/selftests/kvm/guest_memfd_test.c  | 206 ++++++++++++++++++
>  2 files changed, 207 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/guest_memfd_test.c
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftes=
ts/kvm/Makefile
> index ecdea5e7afa8..fd3b30a4ca7b 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -134,6 +134,7 @@ TEST_GEN_PROGS_x86_64 +=3D access_tracking_perf_test
>  TEST_GEN_PROGS_x86_64 +=3D demand_paging_test
>  TEST_GEN_PROGS_x86_64 +=3D dirty_log_test
>  TEST_GEN_PROGS_x86_64 +=3D dirty_log_perf_test
> +TEST_GEN_PROGS_x86_64 +=3D guest_memfd_test
>  TEST_GEN_PROGS_x86_64 +=3D guest_print_test
>  TEST_GEN_PROGS_x86_64 +=3D hardware_disable_test
>  TEST_GEN_PROGS_x86_64 +=3D kvm_create_max_vcpus
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testi=
ng/selftests/kvm/guest_memfd_test.c
> new file mode 100644
> index 000000000000..ea0ae7e25330
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -0,0 +1,206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright Intel Corporation, 2023
> + *
> + * Author: Chao Peng <chao.p.peng@linux.intel.com>
> + */
> +
> +#define _GNU_SOURCE
> +#include "test_util.h"
> +#include "kvm_util_base.h"
> +#include <linux/bitmap.h>
> +#include <linux/falloc.h>
> +#include <sys/mman.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdio.h>
> +#include <fcntl.h>

The include ordering should be fixed. Otherwise,

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> +
> +static void test_file_read_write(int fd)
> +{
> +       char buf[64];
> +
> +       TEST_ASSERT(read(fd, buf, sizeof(buf)) < 0,
> +                   "read on a guest_mem fd should fail");
> +       TEST_ASSERT(write(fd, buf, sizeof(buf)) < 0,
> +                   "write on a guest_mem fd should fail");
> +       TEST_ASSERT(pread(fd, buf, sizeof(buf), 0) < 0,
> +                   "pread on a guest_mem fd should fail");
> +       TEST_ASSERT(pwrite(fd, buf, sizeof(buf), 0) < 0,
> +                   "pwrite on a guest_mem fd should fail");
> +}
> +
> +static void test_mmap(int fd, size_t page_size)
> +{
> +       char *mem;
> +
> +       mem =3D mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED,=
 fd, 0);
> +       TEST_ASSERT_EQ(mem, MAP_FAILED);
> +}
> +
> +static void test_file_size(int fd, size_t page_size, size_t total_size)
> +{
> +       struct stat sb;
> +       int ret;
> +
> +       ret =3D fstat(fd, &sb);
> +       TEST_ASSERT(!ret, "fstat should succeed");
> +       TEST_ASSERT_EQ(sb.st_size, total_size);
> +       TEST_ASSERT_EQ(sb.st_blksize, page_size);
> +}
> +
> +static void test_fallocate(int fd, size_t page_size, size_t total_size)
> +{
> +       int ret;
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE, 0, total_size);
> +       TEST_ASSERT(!ret, "fallocate with aligned offset and size should =
succeed");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +                       page_size - 1, page_size);
> +       TEST_ASSERT(ret, "fallocate with unaligned offset should fail");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size, page_size)=
;
> +       TEST_ASSERT(ret, "fallocate beginning at total_size should fail")=
;
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size=
, page_size);
> +       TEST_ASSERT(ret, "fallocate beginning after total_size should fai=
l");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +                       total_size, page_size);
> +       TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should suc=
ceed");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +                       total_size + page_size, page_size);
> +       TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should =
succeed");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +                       page_size, page_size - 1);
> +       TEST_ASSERT(ret, "fallocate with unaligned size should fail");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +                       page_size, page_size);
> +       TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) with aligned offset and =
size should succeed");
> +
> +       ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size);
> +       TEST_ASSERT(!ret, "fallocate to restore punched hole should succe=
ed");
> +}
> +
> +static void test_invalid_punch_hole(int fd, size_t page_size, size_t tot=
al_size)
> +{
> +       struct {
> +               off_t offset;
> +               off_t len;
> +       } testcases[] =3D {
> +               {0, 1},
> +               {0, page_size - 1},
> +               {0, page_size + 1},
> +
> +               {1, 1},
> +               {1, page_size - 1},
> +               {1, page_size},
> +               {1, page_size + 1},
> +
> +               {page_size, 1},
> +               {page_size, page_size - 1},
> +               {page_size, page_size + 1},
> +       };
> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(testcases); i++) {
> +               ret =3D fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUN=
CH_HOLE,
> +                               testcases[i].offset, testcases[i].len);
> +               TEST_ASSERT(ret =3D=3D -1 && errno =3D=3D EINVAL,
> +                           "PUNCH_HOLE with !PAGE_SIZE offset (%lx) and/=
or length (%lx) should fail",
> +                           testcases[i].offset, testcases[i].len);
> +       }
> +}
> +
> +static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> +{
> +       size_t page_size =3D getpagesize();
> +       uint64_t flag;
> +       size_t size;
> +       int fd;
> +
> +       for (size =3D 1; size < page_size; size++) {
> +               fd =3D __vm_create_guest_memfd(vm, size, 0);
> +               TEST_ASSERT(fd =3D=3D -1 && errno =3D=3D EINVAL,
> +                           "guest_memfd() with non-page-aligned page siz=
e '0x%lx' should fail with EINVAL",
> +                           size);
> +       }
> +
> +       for (flag =3D 1; flag; flag <<=3D 1) {
> +               uint64_t bit;
> +
> +               fd =3D __vm_create_guest_memfd(vm, page_size, flag);
> +               TEST_ASSERT(fd =3D=3D -1 && errno =3D=3D EINVAL,
> +                           "guest_memfd() with flag '0x%lx' should fail =
with EINVAL",
> +                           flag);
> +
> +               for_each_set_bit(bit, &valid_flags, 64) {
> +                       fd =3D __vm_create_guest_memfd(vm, page_size, fla=
g | BIT_ULL(bit));
> +                       TEST_ASSERT(fd =3D=3D -1 && errno =3D=3D EINVAL,
> +                                   "guest_memfd() with flags '0x%llx' sh=
ould fail with EINVAL",
> +                                   flag | BIT_ULL(bit));
> +               }
> +       }
> +}
> +
> +static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
> +{
> +       int fd1, fd2, ret;
> +       struct stat st1, st2;
> +
> +       fd1 =3D __vm_create_guest_memfd(vm, 4096, 0);
> +       TEST_ASSERT(fd1 !=3D -1, "memfd creation should succeed");
> +
> +       ret =3D fstat(fd1, &st1);
> +       TEST_ASSERT(ret !=3D -1, "memfd fstat should succeed");
> +       TEST_ASSERT(st1.st_size =3D=3D 4096, "memfd st_size should match =
requested size");
> +
> +       fd2 =3D __vm_create_guest_memfd(vm, 8192, 0);
> +       TEST_ASSERT(fd2 !=3D -1, "memfd creation should succeed");
> +
> +       ret =3D fstat(fd2, &st2);
> +       TEST_ASSERT(ret !=3D -1, "memfd fstat should succeed");
> +       TEST_ASSERT(st2.st_size =3D=3D 8192, "second memfd st_size should=
 match requested size");
> +
> +       ret =3D fstat(fd1, &st1);
> +       TEST_ASSERT(ret !=3D -1, "memfd fstat should succeed");
> +       TEST_ASSERT(st1.st_size =3D=3D 4096, "first memfd st_size should =
still match requested size");
> +       TEST_ASSERT(st1.st_ino !=3D st2.st_ino, "different memfd should h=
ave different inode numbers");
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +       size_t page_size;
> +       size_t total_size;
> +       int fd;
> +       struct kvm_vm *vm;
> +
> +       TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> +
> +       page_size =3D getpagesize();
> +       total_size =3D page_size * 4;
> +
> +       vm =3D vm_create_barebones();
> +
> +       test_create_guest_memfd_invalid(vm);
> +       test_create_guest_memfd_multiple(vm);
> +
> +       fd =3D vm_create_guest_memfd(vm, total_size, 0);
> +
> +       test_file_read_write(fd);
> +       test_mmap(fd, page_size);
> +       test_file_size(fd, page_size, total_size);
> +       test_fallocate(fd, page_size, total_size);
> +       test_invalid_punch_hole(fd, page_size, total_size);
> +
> +       close(fd);
> +}
> --
> 2.39.1
>
>
