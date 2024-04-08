Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3901089BEF4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 14:28:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PXn2SB+H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCpKc6V1Pz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 22:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PXn2SB+H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=zhiwang@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VClzH39QFz2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 20:42:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 478E26101C;
	Mon,  8 Apr 2024 10:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E9EC433C7;
	Mon,  8 Apr 2024 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712572951;
	bh=b/Ple0Ig9f380CD8S4g6oLAOcX+OtwPclqtC9HiW+mw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PXn2SB+HH0gGSdOSB6uwQC2te3iLBzVI/QAQlIRQ/ovvRqxqatyXEjDT5IlmLBE54
	 eQpPUtOmIOHmxJr8EHDpCEuSlFSEeG66kLXpCH4D5QkHoHHxQqu4fl0C9hE+8NX7rB
	 Dk5A60rdZZhOlUQIE0QkYBoIqa4psq76Vi/HqQoI7WcjWCVs0HxZY7WnDD6RIbehzZ
	 xWKccqRhW1SY2q8W35RTttBVTrPg6ddeOumiQs5d0h5hwwPmbNFnUYdNnstxyGEu9Y
	 YK/keo6oC81pGkBxJCkHrBzCRWQYq3zvyxlg9JDag6rQydgOI60qehLqH4LHFNRJax
	 NUtOKiwTDXC4w==
Date: Mon, 8 Apr 2024 13:42:22 +0300
From: Zhi Wang <zhiwang@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/2] treewide: Use sysfs_bin_attr_simple_read() helper
Message-ID: <20240408134222.00005994.zhiwang@kernel.org>
In-Reply-To: <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
References: <cover.1712410202.git.lukas@wunner.de>
 <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 08 Apr 2024 22:28:00 +1000
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 6 Apr 2024 15:52:02 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> Deduplicate ->read() callbacks of bin_attributes which are backed by a
> simple buffer in memory:
> 
> Use the newly introduced sysfs_bin_attr_simple_read() helper instead,
> either by referencing it directly or by declaring such bin_attributes
> with BIN_ATTR_SIMPLE_RO() or BIN_ATTR_SIMPLE_ADMIN_RO().
> 
> Aside from a reduction of LoC, this shaves off a few bytes from
> vmlinux (304 bytes on an x86_64 allyesconfig).
> 
> No functional change intended.
> 

As for GVT, looks good to me.

Acked-by: Zhi Wang <zhiwang@kernel.org>

> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  arch/powerpc/platforms/powernv/opal.c              | 10 +--------
>  drivers/acpi/bgrt.c                                |  9 +-------
>  drivers/firmware/dmi_scan.c                        | 12 ++--------
>  drivers/firmware/efi/rci2-table.c                  | 10 +--------
>  drivers/gpu/drm/i915/gvt/firmware.c                | 26
> +++++----------------- .../intel/int340x_thermal/int3400_thermal.c
>     |  9 +------- init/initramfs.c
> | 10 +-------- kernel/module/sysfs.c                              |
> 13 +---------- 8 files changed, 14 insertions(+), 85 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal.c
> b/arch/powerpc/platforms/powernv/opal.c index 45dd77e..5d0f35b 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -792,14 +792,6 @@ static int __init opal_sysfs_init(void)
>  	return 0;
>  }
>  
> -static ssize_t export_attr_read(struct file *fp, struct kobject
> *kobj,
> -				struct bin_attribute *bin_attr, char
> *buf,
> -				loff_t off, size_t count)
> -{
> -	return memory_read_from_buffer(buf, count, &off,
> bin_attr->private,
> -				       bin_attr->size);
> -}
> -
>  static int opal_add_one_export(struct kobject *parent, const char
> *export_name, struct device_node *np, const char *prop_name)
>  {
> @@ -826,7 +818,7 @@ static int opal_add_one_export(struct kobject
> *parent, const char *export_name, sysfs_bin_attr_init(attr);
>  	attr->attr.name = name;
>  	attr->attr.mode = 0400;
> -	attr->read = export_attr_read;
> +	attr->read = sysfs_bin_attr_simple_read;
>  	attr->private = __va(vals[0]);
>  	attr->size = vals[1];
>  
> diff --git a/drivers/acpi/bgrt.c b/drivers/acpi/bgrt.c
> index e4fb9e2..d1d9c92 100644
> --- a/drivers/acpi/bgrt.c
> +++ b/drivers/acpi/bgrt.c
> @@ -29,14 +29,7 @@
>  BGRT_SHOW(xoffset, image_offset_x);
>  BGRT_SHOW(yoffset, image_offset_y);
>  
> -static ssize_t image_read(struct file *file, struct kobject *kobj,
> -	       struct bin_attribute *attr, char *buf, loff_t off,
> size_t count) -{
> -	memcpy(buf, attr->private + off, count);
> -	return count;
> -}
> -
> -static BIN_ATTR_RO(image, 0);	/* size gets filled in later */
> +static BIN_ATTR_SIMPLE_RO(image);
>  
>  static struct attribute *bgrt_attributes[] = {
>  	&bgrt_attr_version.attr,
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 015c95a..3d0f773 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -746,16 +746,8 @@ static void __init dmi_scan_machine(void)
>  	pr_info("DMI not present or invalid.\n");
>  }
>  
> -static ssize_t raw_table_read(struct file *file, struct kobject
> *kobj,
> -			      struct bin_attribute *attr, char *buf,
> -			      loff_t pos, size_t count)
> -{
> -	memcpy(buf, attr->private + pos, count);
> -	return count;
> -}
> -
> -static BIN_ATTR(smbios_entry_point, S_IRUSR, raw_table_read, NULL,
> 0); -static BIN_ATTR(DMI, S_IRUSR, raw_table_read, NULL, 0);
> +static BIN_ATTR_SIMPLE_ADMIN_RO(smbios_entry_point);
> +static BIN_ATTR_SIMPLE_ADMIN_RO(DMI);
>  
>  static int __init dmi_init(void)
>  {
> diff --git a/drivers/firmware/efi/rci2-table.c
> b/drivers/firmware/efi/rci2-table.c index de1a9a1..4fd45d6 100644
> --- a/drivers/firmware/efi/rci2-table.c
> +++ b/drivers/firmware/efi/rci2-table.c
> @@ -40,15 +40,7 @@ struct rci2_table_global_hdr {
>  static u32 rci2_table_len;
>  unsigned long rci2_table_phys __ro_after_init =
> EFI_INVALID_TABLE_ADDR; 
> -static ssize_t raw_table_read(struct file *file, struct kobject
> *kobj,
> -			      struct bin_attribute *attr, char *buf,
> -			      loff_t pos, size_t count)
> -{
> -	memcpy(buf, attr->private + pos, count);
> -	return count;
> -}
> -
> -static BIN_ATTR(rci2, S_IRUSR, raw_table_read, NULL, 0);
> +static BIN_ATTR_SIMPLE_ADMIN_RO(rci2);
>  
>  static u16 checksum(void)
>  {
> diff --git a/drivers/gpu/drm/i915/gvt/firmware.c
> b/drivers/gpu/drm/i915/gvt/firmware.c index 4dd52ac..5e66a26 100644
> --- a/drivers/gpu/drm/i915/gvt/firmware.c
> +++ b/drivers/gpu/drm/i915/gvt/firmware.c
> @@ -50,21 +50,7 @@ struct gvt_firmware_header {
>  
>  #define dev_to_drm_minor(d) dev_get_drvdata((d))
>  
> -static ssize_t
> -gvt_firmware_read(struct file *filp, struct kobject *kobj,
> -	     struct bin_attribute *attr, char *buf,
> -	     loff_t offset, size_t count)
> -{
> -	memcpy(buf, attr->private + offset, count);
> -	return count;
> -}
> -
> -static struct bin_attribute firmware_attr = {
> -	.attr = {.name = "gvt_firmware", .mode = (S_IRUSR)},
> -	.read = gvt_firmware_read,
> -	.write = NULL,
> -	.mmap = NULL,
> -};
> +static BIN_ATTR_SIMPLE_ADMIN_RO(gvt_firmware);
>  
>  static int expose_firmware_sysfs(struct intel_gvt *gvt)
>  {
> @@ -107,10 +93,10 @@ static int expose_firmware_sysfs(struct
> intel_gvt *gvt) crc32_start = offsetof(struct gvt_firmware_header,
> version); h->crc32 = crc32_le(0, firmware + crc32_start, size -
> crc32_start); 
> -	firmware_attr.size = size;
> -	firmware_attr.private = firmware;
> +	bin_attr_gvt_firmware.size = size;
> +	bin_attr_gvt_firmware.private = firmware;
>  
> -	ret = device_create_bin_file(&pdev->dev, &firmware_attr);
> +	ret = device_create_bin_file(&pdev->dev,
> &bin_attr_gvt_firmware); if (ret) {
>  		vfree(firmware);
>  		return ret;
> @@ -122,8 +108,8 @@ static void clean_firmware_sysfs(struct intel_gvt
> *gvt) {
>  	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
>  
> -	device_remove_bin_file(&pdev->dev, &firmware_attr);
> -	vfree(firmware_attr.private);
> +	device_remove_bin_file(&pdev->dev, &bin_attr_gvt_firmware);
> +	vfree(bin_attr_gvt_firmware.private);
>  }
>  
>  /**
> diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c index
> 427d370..6d4b51a 100644 ---
> a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c +++
> b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c @@ -73,14
> +73,7 @@ struct odvp_attr { struct device_attribute attr;
>  };
>  
> -static ssize_t data_vault_read(struct file *file, struct kobject
> *kobj,
> -	     struct bin_attribute *attr, char *buf, loff_t off,
> size_t count) -{
> -	memcpy(buf, attr->private + off, count);
> -	return count;
> -}
> -
> -static BIN_ATTR_RO(data_vault, 0);
> +static BIN_ATTR_SIMPLE_RO(data_vault);
>  
>  static struct bin_attribute *data_attributes[] = {
>  	&bin_attr_data_vault,
> diff --git a/init/initramfs.c b/init/initramfs.c
> index da79760..5193fae 100644
> --- a/init/initramfs.c
> +++ b/init/initramfs.c
> @@ -575,15 +575,7 @@ static int __init initramfs_async_setup(char
> *str) #include <linux/initrd.h>
>  #include <linux/kexec.h>
>  
> -static ssize_t raw_read(struct file *file, struct kobject *kobj,
> -			struct bin_attribute *attr, char *buf,
> -			loff_t pos, size_t count)
> -{
> -	memcpy(buf, attr->private + pos, count);
> -	return count;
> -}
> -
> -static BIN_ATTR(initrd, 0440, raw_read, NULL, 0);
> +static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
>  
>  void __init reserve_initrd_mem(void)
>  {
> diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
> index d964167..26efe13 100644
> --- a/kernel/module/sysfs.c
> +++ b/kernel/module/sysfs.c
> @@ -146,17 +146,6 @@ struct module_notes_attrs {
>  	struct bin_attribute attrs[] __counted_by(notes);
>  };
>  
> -static ssize_t module_notes_read(struct file *filp, struct kobject
> *kobj,
> -				 struct bin_attribute *bin_attr,
> -				 char *buf, loff_t pos, size_t count)
> -{
> -	/*
> -	 * The caller checked the pos and count against our size.
> -	 */
> -	memcpy(buf, bin_attr->private + pos, count);
> -	return count;
> -}
> -
>  static void free_notes_attrs(struct module_notes_attrs *notes_attrs,
>  			     unsigned int i)
>  {
> @@ -205,7 +194,7 @@ static void add_notes_attrs(struct module *mod,
> const struct load_info *info) nattr->attr.mode = 0444;
>  			nattr->size = info->sechdrs[i].sh_size;
>  			nattr->private = (void
> *)info->sechdrs[i].sh_addr;
> -			nattr->read = module_notes_read;
> +			nattr->read = sysfs_bin_attr_simple_read;
>  			++nattr;
>  		}
>  		++loaded;

