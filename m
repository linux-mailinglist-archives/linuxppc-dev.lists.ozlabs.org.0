Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F8630E90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 12:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDsRn6m9xz3fbl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 22:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Li+Cd9f2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=ritesh.list@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Li+Cd9f2;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDsNr3dyQz3fBS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 22:48:27 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso7358205pjc.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o9rax4FYMHEb547bH//upiZ4fWNtX6HGAiatJ0B5KnU=;
        b=Li+Cd9f2NbxvaipGdSKNRKGOXCqcC0A9ty2Hid1W6VAz5eMylxnedWgcyV9qekkn7T
         JCiXkaDo8STa9G2DerltgmgDi0R48Q4xoJqyosNg9x/pSZV62ooybmkJP8h4dwjvbdhW
         rt/rAvRDZMiXjpPJEqhgXI40zz+deFiGPpkWjmh/CfoUFilC6qTuK67RZ1PpKltYw3Ut
         JPUx5jt8A0nF99ma96ojCxfit1aWia6eD4BfwkPcHhBNHPb9CQhtU/d8gTMDHpzMwSSL
         qaqq1VfvyieFuthOaLvA9ONC09GJDIk7YOUI6h2i9l+N+I5q7AP6MlUzEC4wYpvXpOMu
         lOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9rax4FYMHEb547bH//upiZ4fWNtX6HGAiatJ0B5KnU=;
        b=rn8Pzt1a7odVR3lo/OUTBy6Eq5U6gq6ao8ocbC4IVoJwtwMpIRc9oyQ6sKXAYc3DF0
         6iiFxglNE2fW7wNdifA9fNLlEgXGmG+ccY4SKLniI8CGU/1g/r7KY799i8oqjCF5rYYs
         OR42H0wIn8SkS7Faak1eQ14ss19U8Xmz4kFJ7NSGCkrsEjnh5/MNMEfRrcHzO8znkjZU
         dzlUeLdtWwYebcj/6+Ukj+8pvcP903vcSSpd8bpoMOWGFNu3+77Zjyyq1XxyRqJFVY6+
         sGhP7NNn/LoAovzHFvRd9SL73TnQx0zRGXFbv8ClxtsvUYnLfVAYUZ56Qq0/ymgvY9l2
         0mrw==
X-Gm-Message-State: ANoB5pkjNGRGIHI2wFh6ta4Hu0YyOH9wUzXIHHcaXeFuEVElor6vcJ83
	LCYb935SNhsXtPo741w0Nhw=
X-Google-Smtp-Source: AA0mqf7P6jcJsjQXvLal1h/ppkR43bLZK00uIGIYM+K8pwUk5a2M3yzRQjUExDLjUVbGY/+dyYdhpg==
X-Received: by 2002:a17:90b:394e:b0:20a:6106:a283 with SMTP id oe14-20020a17090b394e00b0020a6106a283mr2037841pjb.107.1668858505491;
        Sat, 19 Nov 2022 03:48:25 -0800 (PST)
Received: from localhost ([2406:7400:63:f20b:f6ca:e236:f59f:8c18])
        by smtp.gmail.com with ESMTPSA id 189-20020a6218c6000000b0056299fd2ba2sm4885404pfy.162.2022.11.19.03.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 03:48:24 -0800 (PST)
Date: Sat, 19 Nov 2022 17:18:20 +0530
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <20221119114234.nnfxsqx4zxiku2h6@riteshh-domain>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com>
 <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "Serge E. Hallyn" <serge@hallyn.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nayna, 

On 22/11/09 03:10PM, Nayna wrote:
> 
> On 11/9/22 08:46, Greg Kroah-Hartman wrote:
> > On Sun, Nov 06, 2022 at 04:07:42PM -0500, Nayna Jain wrote:
> > > securityfs is meant for Linux security subsystems to expose policies/logs
> > > or any other information. However, there are various firmware security
> > > features which expose their variables for user management via the kernel.
> > > There is currently no single place to expose these variables. Different
> > > platforms use sysfs/platform specific filesystem(efivarfs)/securityfs
> > > interface as they find it appropriate. Thus, there is a gap in kernel
> > > interfaces to expose variables for security features.
> > > 
> > > Define a firmware security filesystem (fwsecurityfs) to be used by
> > > security features enabled by the firmware. These variables are platform
> > > specific. This filesystem provides platforms a way to implement their
> > >   own underlying semantics by defining own inode and file operations.
> > > 
> > > Similar to securityfs, the firmware security filesystem is recommended
> > > to be exposed on a well known mount point /sys/firmware/security.
> > > Platforms can define their own directory or file structure under this path.
> > > 
> > > Example:
> > > 
> > > # mount -t fwsecurityfs fwsecurityfs /sys/firmware/security
> > Why not juset use securityfs in /sys/security/firmware/ instead?  Then
> > you don't have to create a new filesystem and convince userspace to
> > mount it in a specific location?

I am also curious to know on why not use securityfs, given the similarity
between the two. :)
More specifics on that below...

> 
> From man 5 sysfs page:
> 
> /sys/firmware: This subdirectory contains interfaces for viewing and
> manipulating firmware-specific objects and attributes.
> 
> /sys/kernel: This subdirectory contains various files and subdirectories
> that provide information about the running kernel.
> 
> The security variables which are being exposed via fwsecurityfs are managed
> by firmware, stored in firmware managed space and also often consumed by
> firmware for enabling various security features.

That's ok. As I see it users of securityfs can define their own fileops
(like how you are doing in fwsecurityfs).
See securityfs_create_file() & securityfs_create_symlink(), can accept the fops
& iops. Except maybe securityfs_create_dir(), that could be since there might
not be a usecase for it. But do you also need it in your case is the question to
ask.

> 
> From git commit b67dbf9d4c1987c370fd18fdc4cf9d8aaea604c2, the purpose of
> securityfs(/sys/kernel/security) is to provide a common place for all kernel
> LSMs. The idea of

Which was then seperated out by commit,
da31894ed7b654e2 ("securityfs: do not depend on CONFIG_SECURITY").

securityfs now has a seperate CONFIG_SECURITYFS config option. In fact I was even
thinking of why shouldn't we move security/inode.c into fs/securityfs/inode.c .
fs/* is a common place for all filesystems. Users of securityfs can call it's 
exported kernel APIs to create files/dirs/symlinks.

If we move security/inode.c to fs/security/inode.c, then...
...below call within securityfs_init() should be moved into some lsm sepecific 
file.

#ifdef CONFIG_SECURITY
static struct dentry *lsm_dentry;
static ssize_t lsm_read(struct file *filp, char __user *buf, size_t count,
			loff_t *ppos)
{
	return simple_read_from_buffer(buf, count, ppos, lsm_names,
		strlen(lsm_names));
}

static const struct file_operations lsm_ops = {
	.read = lsm_read,
	.llseek = generic_file_llseek,
};
#endif

securityfs_init()

#ifdef CONFIG_SECURITY
	lsm_dentry = securityfs_create_file("lsm", 0444, NULL, NULL,
						&lsm_ops);
#endif

So why not move it? Maybe others, can comment more on whether it's a good idea 
to move security/inode.c into fs/security/inode.c? 
This should then help others identify securityfs filesystem in fs/security/ 
for everyone to notice and utilize for their use?

> fwsecurityfs(/sys/firmware/security) is to similarly provide a common place
> for all firmware security objects.
> 
> /sys/firmware already exists. The patch now defines a new /security
> directory in it for firmware security features. Using /sys/kernel/security
> would mean scattering firmware objects in multiple places and confusing the
> purpose of /sys/kernel and /sys/firmware.

We can also think of it this way that, all security related exports should 
happen via /sys/kernel/security/. Then /sys/kernel/security/firmware/ becomes 
the security related firmware exports.

If you see find /sys -iname firmware, I am sure you will find other firmware
specifics directories related to other specific subsystems
(e.g. 
root@qemu:/home/qemu# find /sys -iname firmware
/sys/devices/ndbus0/nmem0/firmware
/sys/devices/ndbus0/firmware
/sys/firmware
)

But it could be, I am not an expert here, although I was thinking a good 
Documentation might solve this problem.

> 
> Even though fwsecurityfs code is based on securityfs, since the two
> filesystems expose different types of objects and have different
> requirements, there are distinctions:
> 
> 1. fwsecurityfs lets users create files in userspace, securityfs only allows
> kernel subsystems to create files.

Sorry could you please elaborate how? both securityfs & fwsecurityfs
calls simple_fill_super() which uses the same inode (i_op) and inode file 
operations (i_fop) from fs/libfs.c for their root inode. So how it is enabling
user (as in userspace) to create a file in this filesystem?

So am I missing anything?

> 
> 2. firmware and kernel objects may have different requirements. For example,
> consideration of namespacing. As per my understanding, namespacing is
> applied to kernel resources and not firmware resources. That's why it makes
> sense to add support for namespacing in securityfs, but we concluded that
> fwsecurityfs currently doesn't need it. Another but similar example of it

It "currently" doesn't need it. But can it in future? Then why not go with
securityfs which has an additional namespacing feature available?
That's actually also the point of utilizing an existing FS which can get 
features like this in future. As long as it doesn't affect the functionality 
of your use case, we simply need not reject securityfs, no?

> is: TPM space, which is exposed from hardware. For containers, the TPM would
> be made as virtual/software TPM. Similarly for firmware space for
> containers, it would have to be something virtualized/software version of
> it.
> 
> 3. firmware objects are persistent and read at boot time by interaction with
> firmware, unlike kernel objects which are not persistent.

I think this got addressed in a seperate thread.

-ritesh
