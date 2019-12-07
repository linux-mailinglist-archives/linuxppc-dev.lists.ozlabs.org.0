Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD6115AA2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 02:28:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47VBfb6BrNzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 12:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=free.fr
 (client-ip=212.27.42.3; helo=smtp3-g21.free.fr; envelope-from=dftxbs3e@free.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=free.fr
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V8w81Y2fzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 11:09:37 +1100 (AEDT)
Received: from [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c] (unknown
 [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c])
 by smtp3-g21.free.fr (Postfix) with ESMTP id 8FAC913F89C;
 Sat,  7 Dec 2019 01:09:17 +0100 (CET)
Subject: [bug] userspace hitting sporadic SIGBUS on xfs (Power9, ppc64le),
 v4.19 and later
References: <9c0af967-4916-4e8b-e77f-087515793d77@free.fr>
To: Jan Stancek <jstancek@redhat.com>, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, hch@infradead.org, darrick.wong@oracle.com,
 linuxppc-dev@lists.ozlabs.org, Memory Management <mm-qe@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>, CKI Project <cki-project@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>
From: dftxbs3e <dftxbs3e@free.fr>
X-Forwarded-Message-Id: <9c0af967-4916-4e8b-e77f-087515793d77@free.fr>
Message-ID: <e9a171cc-6827-5c43-092a-9dcd8a997b5a@free.fr>
Date: Sat, 7 Dec 2019 01:09:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <9c0af967-4916-4e8b-e77f-087515793d77@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Dec 2019 12:26:41 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

I am very happy that someone has found this issue.

I have been suffering from rather random SIGBUS errors in similar
conditions described by the author.

I don't have much troubleshooting information to provide, however, I hit
the issue regularly so I could investigate during that.

How do you debug such an issue? I tried a debugger etc. but besides
crashing with SIGBUS, I couldnt get any other meaningful information.

dftxbs3e

On 12/3/19 1:50 PM, Jan Stancek wrote:
> Hi,
>
> (This bug report is summary from thread [1] with some additions)
>
> User-space binaries on Power9 ppc64le (with 64k pages) on xfs
> filesystem are sporadically hitting SIGBUS:
>
> ---------- 8< ----------
> (gdb) r
> Starting program: /mnt/testarea/ltp/testcases/bin/genasin
>
> Program received signal SIGBUS, Bus error.
> dl_main (phdr=0x10000040, phnum=<optimized out>, user_entry=0x7fffffffe760, auxv=<optimized out>) at rtld.c:1362
> 1362        switch (ph->p_type)
>
> (gdb) p ph
> $1 = (const Elf64_Phdr *) 0x10000040
>
> (gdb) p *ph
> Cannot access memory at address 0x10000040
>
> (gdb) info proc map
> process 1110670
> Mapped address spaces:
>
>             Start Addr           End Addr       Size     Offset objfile
>             0x10000000         0x10010000    0x10000        0x0 /mnt/testarea/ltp/testcases/bin/genasin
>             0x10010000         0x10030000    0x20000        0x0 /mnt/testarea/ltp/testcases/bin/genasin
>         0x7ffff7f90000     0x7ffff7fb0000    0x20000        0x0 [vdso]
>         0x7ffff7fb0000     0x7ffff7fe0000    0x30000        0x0 /usr/lib64/ld-2.30.so
>         0x7ffff7fe0000     0x7ffff8000000    0x20000    0x20000 /usr/lib64/ld-2.30.so
>         0x7ffffffd0000     0x800000000000    0x30000        0x0 [stack]
>
> (gdb) x/1x 0x10000040
> 0x10000040:     Cannot access memory at address 0x10000040
> ---------- >8 ----------
>
> When this happens the binary continues to hit SIGBUS until page
> is released, for example by: echo 3 > /proc/sys/vm/drop_caches
>
> The issue goes back to at least v4.19.
>
> I can semi-reliably reproduce it with LTP is installed to /mnt/testarea/ltp by:
> while [ True ]; do
>           echo 3 > /proc/sys/vm/drop_caches
>           rm -f /mnt/testarea/ltp/results/RUNTEST.log /mnt/testarea/ltp/output/RUNTEST.run.log
>           ./runltp -p -d results -l RUNTEST.log -o RUNTEST.run.log -f math
>           grep FAIL /mnt/testarea/ltp/results/RUNTEST.log && exit 1
> done
>
> and some stress activity in other terminal (e.g. kernel build).
> Sometimes in minutes, sometimes in hours. It is not reliable
> enough to get meaningful bisect results.
>
> My theory is that there's a race in iomap. There appear to be
> interleaved calls to iomap_set_range_uptodate() for same page
> with varying offset and length. Each call sees bitmap as _not_
> entirely "uptodate" and hence doesn't call SetPageUptodate().
> Even though each bit in bitmap ends up uptodate by the time
> all calls finish.
>
> For example, with following traces:
>
> iomap_set_range_uptodate()
> ...
>           if (uptodate && !PageError(page))
>                   SetPageUptodate(page);
> +
> +       if (mycheck(page)) {
> +               trace_printk("page: %px, iop: %px, uptodate: %d, !PageError(page): %d, flags: %lx\n", page, iop, uptodate, !PageError(page), page->flags);
> +               trace_printk("first: %u, last: %u, off: %u, len: %u, i: %u\n", first, last, off, len, i);
> +       }
>
> I get:
>            genacos-18471 [057] ....   162.465730: iomap_readpages: mapping: c000003f185a1ab0
>            genacos-18471 [057] ....   162.465732: iomap_page_create: iomap_page_create page: c00c00000fe26180, page->private: 0000000000000000, iop: c000003fc70a19c0, flags: 3ffff800000001
>            genacos-18471 [057] ....   162.465736: iomap_set_range_uptodate: page: c00c00000fe26180, iop: c000003fc70a19c0, uptodate: 0, !PageError(page): 1, flags: 3ffff800002001
>            genacos-18471 [057] ....   162.465736: iomap_set_range_uptodate: first: 1, last: 14, off: 4096, len: 57344, i: 16
>             <idle>-0     [060] ..s.   162.534862: iomap_set_range_uptodate: page: c00c00000fe26180, iop: c000003fc70a19c0, uptodate: 0, !PageError(page): 1, flags: 3ffff800002081
>             <idle>-0     [061] ..s.   162.534862: iomap_set_range_uptodate: page: c00c00000fe26180, iop: c000003fc70a19c0, uptodate: 0, !PageError(page): 1, flags: 3ffff800002081
>             <idle>-0     [060] ..s.   162.534864: iomap_set_range_uptodate: first: 0, last: 0, off: 0, len: 4096, i: 16
>             <idle>-0     [061] ..s.   162.534864: iomap_set_range_uptodate: first: 15, last: 15, off: 61440, len: 4096, i: 16
>
> This page doesn't have Uptodate flag set, which leads to filemap_fault()
> returning VM_FAULT_SIGBUS:
>
> crash> p/x ((struct page *) 0xc00c00000fe26180)->flags
> $1 = 0x3ffff800002032
>
> crash> kmem -g 0x3ffff800002032
> FLAGS: 3ffff800002032
>     PAGE-FLAG       BIT  VALUE
>     PG_error          1  0000002
>     PG_dirty          4  0000010
>     PG_lru            5  0000020
>     PG_private_2     13  0002000
>     PG_fscache       13  0002000
>     PG_savepinned     4  0000010
>     PG_double_map    13  0002000
>
> But iomap_page->uptodate in page->private suggests all bits are uptodate:
>
> crash> p/x ((struct page *) 0xc00c00000fe26180)->private
> $2 = 0xc000003fc70a19c0
>
> crash> p/x ((struct iomap_page *) 0xc000003fc70a19c0)->uptodate
> $3 = {0xffff, 0x0}
>
>
> It appears (after ~4 hours) that I can avoid the problem if I split
> the loop so that bits are checked only after all updates are made.
> Not sure if this correct approach, or just making it less reproducible:
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index e25901ae3ff4..abe37031c93d 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -131,7 +131,11 @@ iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
>                   for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
>                           if (i >= first && i <= last)
>                                   set_bit(i, iop->uptodate);
> -                       else if (!test_bit(i, iop->uptodate))
> +               }
> +               for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
> +                       if (i >= first && i <= last)
> +                               continue;
> +                       if (!test_bit(i, iop->uptodate))
>                                   uptodate = false;
>                   }
>           }
>
> Thanks,
> Jan
>
> [1] https://lore.kernel.org/stable/1420623640.14527843.1575289859701.JavaMail.zimbra@redhat.com/T/#u
>
>
