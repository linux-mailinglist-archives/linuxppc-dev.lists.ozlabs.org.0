Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35818F455
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:18:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mD1W3NHXzDrCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 23:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mCyT15y5zDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 23:15:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m5YBGXXb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mCyS1JjFz9sPk;
 Mon, 23 Mar 2020 23:15:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584965744;
 bh=clICM/h45Y0TLcKljhCWbD7p0IYWviTAYxYUMIhnrTY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m5YBGXXbBMNrReym7cIcW3kjWBuj5kAEVGFVXTd1vg1rtvVPfknsIzk2s1WvS624i
 j+e5hM0+cpULR0l+ew3iprHbjKN45XAVb0WZ5wkMrqOtvS8pQI1XeoMwvReKqIV7Iv
 x8DFQucBNV/FMQWtxIBJARNVyzZ+Az4zy08t9+4a+rz00lp9s0BtGJvLZJlhbXPzYe
 fxlwxEhA/2xuLEUtZW3I98Kk2XIhLN9hz4Ig4Wri46VLNaSPr5LM7MQmYVlQxJVgjN
 FojHm1hSBBDzeDTj/6F8L0p+pp08HWiMDBBL1dOyzVxXLWw7OnMcIeeNRHiOWx5jgt
 wwgeMDmcESEEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Haren Myneni <haren@linux.ibm.com>,
 herbert@gondor.apana.org.au
Subject: Re: [PATCH v4 3/9] powerpc/vas: Add VAS user space API
In-Reply-To: <878sjrwm72.fsf@dja-thinkpad.axtens.net>
References: <1584934879.9256.15321.camel@hbabu-laptop>
 <1584936142.9256.15325.camel@hbabu-laptop>
 <878sjrwm72.fsf@dja-thinkpad.axtens.net>
Date: Mon, 23 Mar 2020 23:15:48 +1100
Message-ID: <878sjrclmz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Haren Myneni <haren@linux.ibm.com> writes:
>
>> On power9, userspace can send GZIP compression requests directly to NX
>> once kernel establishes NX channel / window with VAS. This patch provides
>> user space API which allows user space to establish channel using open
>> VAS_TX_WIN_OPEN ioctl, mmap and close operations.
>>
>> Each window corresponds to file descriptor and application can open
>> multiple windows. After the window is opened, VAS_TX_WIN_OPEN icoctl to
>> open a window on specific VAS instance, mmap() system call to map
>> the hardware address of engine's request queue into the application's
>> virtual address space.
>>
>> Then the application can then submit one or more requests to the the
>> engine by using the copy/paste instructions and pasting the CRBs to
>> the virtual address (aka paste_address) returned by mmap().
>>
>> Only NX GZIP coprocessor type is supported right now and allow GZIP
>> engine access via /dev/crypto/nx-gzip device node.
>>
>> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/vas.h              |  11 ++
>>  arch/powerpc/platforms/powernv/Makefile     |   2 +-
>>  arch/powerpc/platforms/powernv/vas-api.c    | 257 ++++++++++++++++++++++++++++
>>  arch/powerpc/platforms/powernv/vas-window.c |   6 +-
>>  arch/powerpc/platforms/powernv/vas.h        |   2 +
>>  5 files changed, 274 insertions(+), 4 deletions(-)
>>  create mode 100644 arch/powerpc/platforms/powernv/vas-api.c
>>
>> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
>> index f93e6b0..e064953 100644
>> --- a/arch/powerpc/include/asm/vas.h
>> +++ b/arch/powerpc/include/asm/vas.h
>> @@ -163,4 +163,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
>>   */
>>  int vas_paste_crb(struct vas_window *win, int offset, bool re);
>>  
>> +/*
>> + * Register / unregister coprocessor type to VAS API which will be exported
>> + * to user space. Applications can use this API to open / close window
>> + * which can be used to send / receive requests directly to cooprcessor.
>> + *
>> + * Only NX GZIP coprocessor type is supported now, but this API can be
>> + * used for others in future.
>> + */
>> +int vas_register_coproc_api(struct module *mod);
>> +void vas_unregister_coproc_api(void);
>> +
>>  #endif /* __ASM_POWERPC_VAS_H */
>> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
>> index 395789f..fe3f0fb 100644
>> --- a/arch/powerpc/platforms/powernv/Makefile
>> +++ b/arch/powerpc/platforms/powernv/Makefile
>> @@ -17,7 +17,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
>>  obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
>>  obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
>>  obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
>> -obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
>> +obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o vas-api.o
>>  obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
>>  obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
>>  obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
>> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
>> new file mode 100644
>> index 0000000..7d049af
>> --- /dev/null
>> +++ b/arch/powerpc/platforms/powernv/vas-api.c
>> @@ -0,0 +1,257 @@
...
>> +
>> +static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
>> +{
>> +	struct vas_window *txwin = fp->private_data;
>> +	unsigned long pfn;
>> +	u64 paste_addr;
>> +	pgprot_t prot;
>> +	int rc;
>> +
>> +	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
>
> I think you said this should be 4096 rather than 64k, regardless of what
> PAGE_SIZE you are compiled with?

You can't mmap less than a page, a page is PAGE_SIZE bytes.

So if that checked for 4K explicitly it would prevent mmap on 64K
kernels always, which seems like not what you want?

cheers
