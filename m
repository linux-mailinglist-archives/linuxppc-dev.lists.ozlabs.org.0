Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDE361AB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 09:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM7SQ0Zzmz3c1m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 17:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=eQPVRVL+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=eQPVRVL+; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM7Rz3rY8z3bSj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 17:41:02 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G7XvJx008767;
 Fri, 16 Apr 2021 07:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ljDSDK3Q1ImvITaEF0v+ltA3ZnYUagyVmRJFy5Xu9UU=;
 b=eQPVRVL+7ECrSdEhckrbFCa5aHAsjIujPsQ/dyeOJVCXiHl64BqkEcJ+yWTVXC4CofbD
 WUVMaCKrcSAuBL8YZz5HUrNjvXBbxiegHAvIqzgg+pBp8b91l7X2eSaC5bpQQZNzPPax
 2ECyhwhUmZrvP3Ov2ddcYr+Q/ytzcqmQ7H8UIxuDYOAE2KTDHVRReEAmbG9hYfIfKV0l
 2vDQkkuqhmxs2yzsaroG9vA+JNZkKu5Sb/06MLFTWN5PvrZPnt8fIGcKQGAmNoOWsBDC
 m7j48WooLDuaBeIfQepiGPwuDTsCYSn35XIfocqi9D3gymfOPWAi+AHK4sXRQRqksqvP Gw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37u3err83p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 07:40:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G7dp7K132935;
 Fri, 16 Apr 2021 07:40:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 37unx43x6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 07:40:46 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13G7efs0010074;
 Fri, 16 Apr 2021 07:40:41 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 16 Apr 2021 00:40:41 -0700
Date: Fri, 16 Apr 2021 10:40:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
Message-ID: <20210416074034.GN6048@kadam>
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eefag241.fsf@linkitivity.dja.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160057
X-Proofpoint-ORIG-GUID: PIKedz6Dm6ImVWbKw9yHjEjKggRYogvD
X-Proofpoint-GUID: PIKedz6Dm6ImVWbKw9yHjEjKggRYogvD
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160056
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 robh@kernel.org, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 04:44:30PM +1000, Daniel Axtens wrote:
> Hi Lakshmi,
> 
> > On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
> >
> > Sorry - missed copying device-tree and powerpc mailing lists.
> >
> >> There are a few "goto out;" statements before the local variable "fdt"
> >> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> >> elf64_load(). This will result in an uninitialized "fdt" being passed
> >> to kvfree() in this function if there is an error before the call to
> >> of_kexec_alloc_and_setup_fdt().
> >> 
> >> Initialize the local variable "fdt" to NULL.
> >>
> I'm a huge fan of initialising local variables!

Don't be!  It just disables static checker warnings and hides bugs.
The kbuild emails are archived but the email is mangled and unreadable.
https://www.mail-archive.com/kbuild@lists.01.org/msg06371.html

I think maybe you're not on the most recent code.  In linux-next this
code looks like:

arch/powerpc/kexec/elf_64.c
    27  static void *elf64_load(struct kimage *image, char *kernel_buf,
    28                          unsigned long kernel_len, char *initrd,
    29                          unsigned long initrd_len, char *cmdline,
    30                          unsigned long cmdline_len)
    31  {
    32          int ret;
    33          unsigned long kernel_load_addr;
    34          unsigned long initrd_load_addr = 0, fdt_load_addr;
    35          void *fdt;
    36          const void *slave_code;
    37          struct elfhdr ehdr;
    38          char *modified_cmdline = NULL;
    39          struct kexec_elf_info elf_info;
    40          struct kexec_buf kbuf = { .image = image, .buf_min = 0,
    41                                    .buf_max = ppc64_rma_size };
    42          struct kexec_buf pbuf = { .image = image, .buf_min = 0,
    43                                    .buf_max = ppc64_rma_size, .top_down = true,
    44                                    .mem = KEXEC_BUF_MEM_UNKNOWN };
    45  
    46          ret = kexec_build_elf_info(kernel_buf, kernel_len, &ehdr, &elf_info);
    47          if (ret)
    48                  goto out;
                        ^^^^^^^^
I really despise "goto out;" because freeing things which haven't been
allocated is always dangerous.

[ snip ].


   143  out:
   144          kfree(modified_cmdline);
   145          kexec_free_elf_info(&elf_info);
                                     ^^^^^^^^
There is a possibility that "elf_info" has holds uninitialized stack
data if elf_read_ehdr() fails so that's probably fixing as well.  kexec()
is root only so this can't be exploited.

   146  
   147          /*
   148           * Once FDT buffer has been successfully passed to kexec_add_buffer(),
   149           * the FDT buffer address is saved in image->arch.fdt. In that case,
   150           * the memory cannot be freed here in case of any other error.
   151           */
   152          if (ret && !image->arch.fdt)
   153                  kvfree(fdt);
                               ^^^
Uninitialized.

   154  
   155          return ret ? ERR_PTR(ret) : NULL;
   156  }

regards,
dan carpenter
