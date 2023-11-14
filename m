Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C97EB480
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 17:09:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVB8L2swfz3cS3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 03:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perches.com (client-ip=216.40.44.13; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 354 seconds by postgrey-1.37 at boromir; Wed, 15 Nov 2023 03:09:25 AEDT
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVB7n315Nz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 03:09:23 +1100 (AEDT)
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 5849480ADD;
	Tue, 14 Nov 2023 16:03:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id B79FD17;
	Tue, 14 Nov 2023 16:03:19 +0000 (UTC)
Message-ID: <1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com>
Subject: Re: [PATCH 1/7] kexec_file: add kexec_file flag to control debug
 printing
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Date: Tue, 14 Nov 2023 08:03:17 -0800
In-Reply-To: <20231114153253.241262-2-bhe@redhat.com>
References: <20231114153253.241262-1-bhe@redhat.com>
	 <20231114153253.241262-2-bhe@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: B79FD17
X-Spam-Status: No, score=-0.12
X-Rspamd-Server: rspamout06
X-Stat-Signature: hfguyu43qitk9i95uumxmjn7sq3qxaae
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+TPCSBX5eIBtFS7cutbFXyyoB+lO2Ea1A=
X-HE-Tag: 1699977799-197779
X-HE-Meta: U2FsdGVkX199MxvfdP2OiWMaMCgnF+zen3H+uDaMOt+eo18KFoigVkpo/j1mPnNdRxZsnaKbc/2TMWhhtZ1WYbE4xnaRnZ9D8ImVTw0nNbwHPVmM8K50LsJ54PlQr2IROfdWLMnnNPpRHRTXWI450/26vHlRs47bJHW69JfdozUlDgILIKSRfePjUbHAIXoIKr9/NzIpcA6QdsnzFrKhA8GVb/HExMWgTm+7q60/jyGC6TQFrwo3I1762UXDKC1ld2/TBOn7K4fNFKAezne04n/qoyaeJN2h75PDcDpXFrJm8izGV0wc97AWTmYxsKdc
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-11-14 at 23:32 +0800, Baoquan He wrote:
> When specifying 'kexec -c -d', kexec_load interface will print loading
> information, e.g the regions where kernel/initrd/purgatory/cmdline
> are put, the memmap passed to 2nd kernel taken as system RAM ranges,
> and printing all contents of struct kexec_segment, etc. These are
> very helpful for analyzing or positioning what's happening when
> kexec/kdump itself failed. The debugging printing for kexec_load
> interface is made in user space utility kexec-tools.
>=20
> Whereas, with kexec_file_load interface, 'kexec -s -d' print nothing.
> Because kexec_file code is mostly implemented in kernel space, and the
> debugging printing functionality is missed. It's not convenient when
> debugging kexec/kdump loading and jumping with kexec_file_load
> interface.
>=20
> Now add KEXEC_FILE_DEBUG to kexec_file flag to control the debugging
> message printing. And add global variable kexec_file_dbg_print and
> macro kexec_dprintk() to facilitate the printing.
>=20
> This is a preparation, later kexec_dprintk() will be used to replace the
> existing pr_debug(). Once 'kexec -s -d' is specified, it will print out
> kexec/kdump loading information. If '-d' is not specified, it regresses
> to pr_debug().

Not quite as pr_debug is completely eliminated with
zero object size when DEBUG is not #defined.

Now the object size will be larger and contain the
formats in .text.

[]
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
[]
> @@ -264,6 +264,18 @@ arch_kexec_apply_relocations(struct purgatory_info *=
pi, Elf_Shdr *section,
>  	return -ENOEXEC;
>  }
>  #endif
> +
> +extern bool kexec_file_dbg_print;
> +
> +#define kexec_dprintk(fmt, args...)			\
> +	do {						\
> +		if (kexec_file_dbg_print)		\
> +			printk(KERN_INFO fmt, ##args);	\
> +		else					\
> +			printk(KERN_DEBUG fmt, ##args);	\
> +	} while (0)
> +
> +

I don't know how many of these printks exist and if
overall object size matters but using

#define kexec_dprintkfmt, ...)					\
	printk("%s" fmt,					\
	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
	       ##__VA_ARGS__)

should reduce overall object size by eliminating the
mostly duplicated format in .text which differs only
by the KERN_<PREFIX>


