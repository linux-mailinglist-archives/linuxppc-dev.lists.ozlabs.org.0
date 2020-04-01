Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD34F19B8A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:46:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t1Wr4PwCzDr6P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=Q+X9bQgx; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48t1Tr2LtVzDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 09:44:30 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 22B052DC3330;
 Thu,  2 Apr 2020 09:44:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585781068;
 bh=WUswt0ThdKMOtAdHSGA44cKKcSd3ehspVRkSu90GPuc=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=Q+X9bQgxOtA5bsZVhJSZiti3BRxki0C2mffeI2DXnUE3CkLpmXE+kHLmtH/P46E1P
 CRNkH9f0LIOdAdxEZvULLLR9giWg7DPYwZcdCmMEAVaoiZf0mpRES3bQ+dIci0dZ6x
 CVaZX+aQc/i3CyN/22RLJ/4ajJUGOIhqkQUOKBgolmlxwZA9bAlInBjqTXLhoBGPvz
 MrmXGWiKCh1yXwT8R/cvfIcfpjof2x6il0XWMjXLd9wAhLidMIuUGA9bZ1Ov+W8tYP
 K184yedXzhaatalU7J8WG1B7/MVjTmz2Eo+8Jij4j2kTfhJfTrS9yjlm/Evk9Ill58
 qun6TuxLAc8jsopXtUXlTNc/ZEv2T+v/RAFRzhyeGOAzKd6fgRppuL9mXityB/qQ7r
 GSMJBvNxivd25f6qEbC2bvr/mJ293TsXG5IQWRqqr8utNP719IajcEdC8G4gt6hUHb
 cjxY3jO0DOvv+7BUAujvJT0hf0iu7LRil/MWCByVAWIdyiOEu+CJ2bDK7IfFA/KOrQ
 iwNS+i4Mc1HVyv9nnJfGBV5tk5ovsNQfuMikZKT8qtLwU5aSYfTvMTfCLLOE7r8A8F
 s4RBIGEvKEvI2P7pI93f3BmJcEUa2TiqAsIz/suS0dy9yWHtjBaIc8ZlLIX+bBx35e
 RDq8iXRDScrTJTbX8OnnWyxg=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id 031MiEaB088120
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 2 Apr 2020 09:44:16 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Dan Williams'" <dan.j.williams@intel.com>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <CAPcyv4iJYZBVhV1NW7EB6-EwETiUAy6r1iiE+F+HvFXfGZt9Aw@mail.gmail.com>
In-Reply-To: <CAPcyv4iJYZBVhV1NW7EB6-EwETiUAy6r1iiE+F+HvFXfGZt9Aw@mail.gmail.com>
Subject: RE: [PATCH v4 00/25] Add support for OpenCAPI Persistent Memory
 devices
Date: Thu, 2 Apr 2020 09:44:13 +1100
Message-ID: <2d6901d60877$16aa7a90$43ff6fb0$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-au
Thread-Index: AQJ5L4Hn/mp5p0p1jYAFWLJ+xmWSbgGC/kF4pxJ1VcA=
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Thu, 02 Apr 2020 09:44:23 +1100 (AEDT)
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
Cc: 'Madhavan Srinivasan' <maddy@linux.vnet.ibm.com>,
 'Alexey Kardashevskiy' <aik@ozlabs.ru>,
 'Masahiro Yamada' <yamada.masahiro@socionext.com>,
 'Oliver O'Halloran' <oohall@gmail.com>,
 'Mauro Carvalho Chehab' <mchehab+samsung@kernel.org>,
 'Ira Weiny' <ira.weiny@intel.com>, 'Rob Herring' <robh@kernel.org>,
 'Dave Jiang' <dave.jiang@intel.com>,
 'linux-nvdimm' <linux-nvdimm@lists.01.org>,
 "'Aneesh Kumar K . V'" <aneesh.kumar@linux.ibm.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Anju T Sudhakar' <anju@linux.vnet.ibm.com>,
 'Mahesh Salgaonkar' <mahesh@linux.vnet.ibm.com>,
 'Andrew Donnellan' <ajd@linux.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>,
 'Greg Kurz' <groug@kaod.org>, 'Nicholas Piggin' <npiggin@gmail.com>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 'Thomas Gleixner' <tglx@linutronix.de>,
 'Hari Bathini' <hbathini@linux.ibm.com>, 'Linux MM' <linux-mm@kvack.org>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
 'Vishal Verma' <vishal.l.verma@intel.com>,
 'Frederic Barrat' <fbarrat@linux.ibm.com>, 'Paul Mackerras' <paulus@samba.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'linuxppc-dev' <linuxppc-dev@lists.ozlabs.org>,
 "'David S. Miller'" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Dan Williams <dan.j.williams@intel.com>
> Sent: Wednesday, 1 April 2020 7:48 PM
> To: Alastair D'Silva <alastair@d-silva.org>
> Cc: Aneesh Kumar K . V <aneesh.kumar@linux.ibm.com>; Oliver O'Halloran
> <oohall@gmail.com>; Benjamin Herrenschmidt
> <benh@kernel.crashing.org>; Paul Mackerras <paulus@samba.org>; Michael
> Ellerman <mpe@ellerman.id.au>; Frederic Barrat =
<fbarrat@linux.ibm.com>;
> Andrew Donnellan <ajd@linux.ibm.com>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang
> <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Andrew Morton
> <akpm@linux-foundation.org>; Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org>; David S. Miller <davem@davemloft.net>;
> Rob Herring <robh@kernel.org>; Anton Blanchard <anton@ozlabs.org>;
> Krzysztof Kozlowski <krzk@kernel.org>; Mahesh Salgaonkar
> <mahesh@linux.vnet.ibm.com>; Madhavan Srinivasan
> <maddy@linux.vnet.ibm.com>; C=C3=A9dric Le Goater <clg@kaod.org>; Anju =
T
> Sudhakar <anju@linux.vnet.ibm.com>; Hari Bathini
> <hbathini@linux.ibm.com>; Thomas Gleixner <tglx@linutronix.de>; Greg
> Kurz <groug@kaod.org>; Nicholas Piggin <npiggin@gmail.com>; Masahiro
> Yamada <yamada.masahiro@socionext.com>; Alexey Kardashevskiy
> <aik@ozlabs.ru>; Linux Kernel Mailing List =
<linux-kernel@vger.kernel.org>;
> linuxppc-dev <linuxppc-dev@lists.ozlabs.org>; linux-nvdimm <linux-
> nvdimm@lists.01.org>; Linux MM <linux-mm@kvack.org>
> Subject: Re: [PATCH v4 00/25] Add support for OpenCAPI Persistent =
Memory
> devices
>=20
> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva =
<alastair@d-silva.org>
> wrote:
> >
> > This series adds support for OpenCAPI Persistent Memory devices on
> > bare metal (arch/powernv), exposing them as nvdimms so that we can
> > make use of the existing infrastructure. There already exists a =
driver
> > for the same devices abstracted through PowerVM (arch/pseries):
> > arch/powerpc/platforms/pseries/papr_scm.c
> >
> > These devices are connected via OpenCAPI, and present as LPC (lowest
> coherence point) memory to the system, practically, that means that
> memory on these cards could be treated as conventional, cache-coherent
> memory.
> >
> > Since the devices are connected via OpenCAPI, they are not =
enumerated
> via ACPI. Instead, OpenCAPI links present as pseudo-PCI bridges, with
> devices below them.
> >
> > This series introduces a driver that exposes the memory on these =
cards as
> nvdimms, with each card getting it's own bus. This is somewhat =
complicated
> by the fact that the cards do not have out of band persistent storage =
for
> metadata, so 1 SECTION_SIZE's (see SPARSEMEM) worth of storage is =
carved
> out of the top of the card storage to implement the ndctl_config_* =
calls.
>=20
> Is it really tied to section-size? Can't that change based on the =
configured
> page-size? It's not clear to me why that would be the choice, but I'll =
dig into
> the implementation.
>=20

I had tried using PAGE_SIZE, but ran into problems carving off just 1 =
page and handing it to the kernel, while leaving the rest as pmem. That =
was a while ago though, so maybe I should retry it.

> > The driver is not responsible for configuring the NPU (NVLink =
Processing
> Unit) BARs to map the LPC memory from the card into the system's =
physical
> address space, instead, it requests this to be done via OPAL calls =
(typically
> implemented by Skiboot).
>=20
> Are OPAL calls similar to ACPI DSMs? I.e. methods for the OS to invoke
> platform firmware services? What's Skiboot?
>=20

Yes, OPAL is the interface to firmware for POWER. Skiboot is the =
open-source (and only) implementation of OPAL.

> >
> > The series is structured as follows:
> >  - Required infrastructure changes & cleanup
> >  - A minimal driver implementation
> >  - Implementing additional features within the driver
>=20
> Thanks for the intro and the changelog!
>=20
> >
> > Changelog:
> > V4:
> >   - Rebase on next-20200320
>=20
> Do you have dependencies on other material that's in -next? Otherwise =
-
> next is only a viable development baseline if you are going to merge =
through
> Andrew's tree.
>=20
> >   - Bump copyright to 2020
> >   - Ensure all uapi headers use C89 compatible comments (missed
> ocxlpmem.h)
> >   - Move the driver back to drivers/nvdimm/ocxl, after confirmation
> >     that this location is desirable
> >   - Rename ocxl.c to ocxlpmem.c (+ support files)
> >   - Rename all ocxl_pmem to ocxlpmem
> >   - Address checkpatch --strict issues
> >   - "powerpc/powernv: Add OPAL calls for LPC memory alloc/release"
> >         - Pass base address as __be64
> >   - "ocxl: Tally up the LPC memory on a link & allow it to be =
mapped"
> >         - Address checkpatch spacing warnings
> >         - Reword blurb
> >         - Reword size description for ocxl_link_add_lpc_mem()
> >         - Add an early exit in ocxl_link_lpc_release() to avoid =
triggering
> >           bogus warnings if called after ocxl_link_lpc_map() fails
> >   - "powerpc/powernv: Add OPAL calls for LPC memory alloc/release"
> >         - Reword blurb
> >   - "powerpc/powernv: Map & release OpenCAPI LPC memory"
> >         - Reword blurb
> >   - Move minor_idr init from file_init() to ocxlpmem_init() (fixes =
runtime
> error
> >     in "nvdimm: Add driver for OpenCAPI Persistent Memory")
> >   - Wrap long lines
> >   - "nvdimm: Add driver for OpenCAPI Storage Class Memory"
> >         - Remove '+ 1' workround from serial number->cookie =
assignment
> >         - Drop out of memory message for ocxlpmem in probe()
> >         - Fix leaks of ocxlpmem & ocxlpmem->ocxl_fn in probe()
> >         - remove struct ocxlpmem_function0, it didn't value add
> >         - factor out err_unregistered label in probe
> >         - Address more checkpatch warnings
> >         - get/put the pci dev on probe/free
> >         - Drop ocxlpmem_ prefix from static functions
> >         - Propogate errors up from called functions in probe()
> >         - Set MODULE_LICENSE to GPLv2
> >         - Add myself as module author
> >         - Call nvdimm_bus_unregister() in remove() to release =
references
> >         - Don't call devm_memunmap on metadata_address, the release
> handler on
> >          the device already deals with this
> >   - "nvdimm/ocxl: Read the capability registers & wait for device =
ready"
> >         - Fix mask for read_latency
> >         - Fold in is_usable logic into timeout to remove error =
message race
> >         - propogate bad rc from read_device_metadata
> >   - "nvdimm/ocxl: Add register addresses & status values to the =
header"
> >         - Add comments for register abbreviations where names have =
been
> >           expanded
> >         - Add missing status for blocked on background task
> >         - Alias defines for firmware update status to show that the =
duplication
> >           of values is intentional
> >   - "nvdimm/ocxl: Register a character device for userspace to =
interact with"
> >         - Add lock around minors IDR, delete the cdev before
> device_unregister
> >         - Propogate errors up from called functions in probe()
> >   - "nvdimm/ocxl: Add support for Admin commands"
> >         - Fix typo in setup_command_data error message, and drop =
'ocxl' from
> it
> >         - Drop vestigial CHI read from admin_command_request
> >         - Change command ID mismatch message to dev_err, and return =
an
> error
> >         - Use jiffies to implement admin_command_complete_timeout()
> >         - Flesh out blurb
> >         - Create a wrapper to issue the command & wait for timeout
> >   - "nvdimm/ocxl: Add support for near storage commands"
> >         - dropped (will submit with the patches for nvdimm =
overwrite)
> >   - "nvdimm/ocxl: Implement the Read Error Log command"
> >         - Remove stray blank line
> >         - change misplaced goto to an early exit in read_error_log
> >         - Inline error_log_offset_0x08
> >         - Read WWID data as LE rather than host endian
> >         - Move the include of nvdimm/ocxlpmem.h to ocxl.c
> >         - Add padding after fwrevision in struct =
ioctl_ocxl_pmem_error_log
> >         - Register IOCTL magic
> >         - Coerce pointers to __u64 in IOCTLs
> >   - "nvdimm/ocxl: Add controller dump IOCTLs"
> >         - Coerce pointers to __u64 in IOCTLs
> >         - Document expected IOCTL usage in blurb
> >         - Add missing rc check
> >         - Only populate up to the number of bytes returned by the =
card,
> >           and return this length to the caller
> >         - Add missing header check
> >   - "nvdimm/ocxl: Add an IOCTL to report controller statistics"
> >         - Update to match the latest version of the spec
> >         - Verify that parametr block IDs & lengths match what we =
expect
> >         - Use defines for offsets
> >   - "nvdimm/ocxl: Forward events to userspace"
> >         - Don't enable NSCRA doorbell
> >         - return -EBUSY if the event context is already used
> >         - return -ENODEV if IRQs cannot be mapped
> >         - Tag IRQ pointers with __iomem
> >         - Drop ocxlpmem_ prefix from static functions
> >         - Propogate error from eventfd_ctx_fdget
> >         - Fix error check in copy_to_user
> >         - Drop GLOBAL_MMIO_CHI_NSCRA (this should be in the =
overwrite
> patch)
> >         - Drop unused irq_pgmap
> >         - Don't redef BIT_ULL
> >   - "nvdimm/ocxl: Add debug IOCTLs"
> >         - Eliminate clearing loop (now done in =
admin_command_execute()
> >         - Drop dummy IOCTLs if CONFIG_OCXL_PMEM_DEBUG is not set
> >         - Group debug IOCTLs together & comment that they may not be
> available
> >   - "nvdimm/ocxl: Expose SMART data via ndctl"
> >         - Drop 'rc =3D 0; goto out;'
> >         - Propogate errors from ndctl_smart()
> >   - "nvdimm/ocxl: Expose the serial number in sysfs" & "nvdimm/ocxl:
> Expose the firmware version in sysfs"
> >         - Squash these 2 patches together
> >         - Expose data as a DIMM attribute rather than an ocxlpmem
> >           attribute
> >   - "nvdimm/ocxl: Add an IOCTL to request controller health & perf =
data"
> >         - Reword blurb
> >   - "nvdimm/ocxl: Implement the heartbeat command"
> >         - Propogate rc in probe()
> >
> > V3:
> >   - Rebase against next/next-20200220
> >   - Move driver to arch/powerpc/platforms/powernv, we now expect =
this
> >     driver to go upstream via the powerpc tree
> >   - "nvdimm/ocxl: Implement the Read Error Log command"
> >         - Fix bad header path
> >   - "nvdimm/ocxl: Read the capability registers & wait for device =
ready"
> >         - Fix overlapping masks between readiness_timeout &
> memory_available_timeout
> >   - "nvdimm: Add driver for OpenCAPI Storage Class Memory"
> >         - Address minor review comments from Jonathan Cameron
> >         - Remove attributes
> >         - Default to module if building LIBNVDIMM
> >         - Propogate errors up from called functions in probe()
> >   - "nvdimm/ocxl: Expose SMART data via ndctl"
> >         - Pack attributes in struct
> >         - Support different size SMART buffers for compatibility =
with newer
> >           ndctls that may want more SMART attribs than we provide
> >         - Rework to to use ND_CMD_CALL instead of ND_CMD_SMART
> >   - drop "ocxl: Free detached contexts in ocxl_context_detach_all()"
> >   - "powerpc: Map & release OpenCAPI LPC memory"
> >         - Remove 'extern'
> >         - Only available with CONFIG_MEMORY_HOTPLUG_SPARSE
> >   - "ocxl: Tally up the LPC memory on a link & allow it to be =
mapped"
> >         - Address minor review comments from Jonathan Cameron
> >   - "ocxl: Add functions to map/unmap LPC memory"
> >         - Split detected memory message into a separate patch
> >         - Address minor review comments from Jonathan Cameron
> >         - Add a comment explaining why unmap_lpc_mem is in
> deconfigure_afu
> >   - "nvdimm/ocxl: Add support for Admin commands"
> >         - use sizeof(u64) rather than 0x08 when iterating u64s
> >   - "nvdimm/ocxl: Implement the heartbeat command"
> >         - Fix typo in blurb
> >   - Address kernel doc issues
> >   - Ensure all uapi headers use C89 compatible comments
> >   - Drop patches for firmware update & overwrite, these will be
> >     submitted later once patches are available for ndctl
> >   - Rename SCM to OpenCAPI Persistent Memory
> >
> > V2:
> >   - "powerpc: Map & release OpenCAPI LPC memory"
> >       - Fix #if -> #ifdef
> >       - use pci_dev_id to get the bdfn
> >       - use __be64 to hold be data
> >       - indent check_hotplug_memory_addressable correctly
> >       - Remove export of check_hotplug_memory_addressable
> >   - "ocxl: Conditionally bind SCM devices to the generic OCXL =
driver"
> >       - Improve patch description and remove redundant default
> >   - "nvdimm: Add driver for OpenCAPI Storage Class Memory"
> >       - Mark a few funcs as static as identified by the 0day bot
> >       - Add OCXL dependancies to OCXL_SCM
> >       - Use memcpy_mcsafe in scm_ndctl_config_read
> >       - Rename scm_foo_offset_0x00 to scm_foo_header_parse & add =
docs
> >       - Name DIMM attribs "ocxl" rather than "scm"
> >       - Split out into base + many feature patches
> >   - "powerpc: Enable OpenCAPI Storage Class Memory driver on bare
> metal"
> >       - Build DEV_DAX & friends as modules
> >   - "ocxl: Conditionally bind SCM devices to the generic OCXL =
driver"
> >       - Patch dropped (easy enough to maintain this out of tree for
> development)
> >   - "ocxl: Tally up the LPC memory on a link & allow it to be =
mapped"
> >       - Add a warning if an unmatched lpc_release is called
> >   - "ocxl: Add functions to map/unmap LPC memory"
> >       - Use EXPORT_SYMBOL_GPL
> >
> >
> > Alastair D'Silva (25):
> >   powerpc/powernv: Add OPAL calls for LPC memory alloc/release
> >   mm/memory_hotplug: Allow check_hotplug_memory_addressable to be
> called
> >     from drivers
> >   powerpc/powernv: Map & release OpenCAPI LPC memory
> >   ocxl: Remove unnecessary externs
> >   ocxl: Address kernel doc errors & warnings
> >   ocxl: Tally up the LPC memory on a link & allow it to be mapped
> >   ocxl: Add functions to map/unmap LPC memory
> >   ocxl: Emit a log message showing how much LPC memory was detected
> >   ocxl: Save the device serial number in ocxl_fn
> >   nvdimm: Add driver for OpenCAPI Persistent Memory
> >   powerpc: Enable the OpenCAPI Persistent Memory driver for
> >     powernv_defconfig
> >   nvdimm/ocxl: Add register addresses & status values to the header
> >   nvdimm/ocxl: Read the capability registers & wait for device ready
> >   nvdimm/ocxl: Add support for Admin commands
> >   nvdimm/ocxl: Register a character device for userspace to interact
> >     with
> >   nvdimm/ocxl: Implement the Read Error Log command
> >   nvdimm/ocxl: Add controller dump IOCTLs
> >   nvdimm/ocxl: Add an IOCTL to report controller statistics
> >   nvdimm/ocxl: Forward events to userspace
> >   nvdimm/ocxl: Add an IOCTL to request controller health & perf data
> >   nvdimm/ocxl: Implement the heartbeat command
> >   nvdimm/ocxl: Add debug IOCTLs
> >   nvdimm/ocxl: Expose SMART data via ndctl
> >   nvdimm/ocxl: Expose the serial number & firmware version in sysfs
> >   MAINTAINERS: Add myself & nvdimm/ocxl to ocxl
> >
> >  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
> >  MAINTAINERS                                   |    3 +
> >  arch/powerpc/configs/powernv_defconfig        |    5 +
> >  arch/powerpc/include/asm/opal-api.h           |    2 +
> >  arch/powerpc/include/asm/opal.h               |    2 +
> >  arch/powerpc/include/asm/pnv-ocxl.h           |   42 +-
> >  arch/powerpc/platforms/powernv/ocxl.c         |   43 +
> >  arch/powerpc/platforms/powernv/opal-call.c    |    2 +
> >  drivers/misc/ocxl/config.c                    |   74 +-
> >  drivers/misc/ocxl/core.c                      |   61 +
> >  drivers/misc/ocxl/link.c                      |   60 +
> >  drivers/misc/ocxl/ocxl_internal.h             |   45 +-
> >  drivers/nvdimm/Kconfig                        |    2 +
> >  drivers/nvdimm/Makefile                       |    1 +
> >  drivers/nvdimm/ocxl/Kconfig                   |   21 +
> >  drivers/nvdimm/ocxl/Makefile                  |    7 +
> >  drivers/nvdimm/ocxl/main.c                    | 1975 =
+++++++++++++++++
> >  drivers/nvdimm/ocxl/ocxlpmem.h                |  197 ++
> >  drivers/nvdimm/ocxl/ocxlpmem_internal.c       |  280 +++
> >  include/linux/memory_hotplug.h                |    5 +
> >  include/misc/ocxl.h                           |  122 +-
> >  include/uapi/linux/ndctl.h                    |    1 +
> >  include/uapi/nvdimm/ocxlpmem.h                |  127 ++
> >  mm/memory_hotplug.c                           |    4 +-
> >  24 files changed, 2983 insertions(+), 99 deletions(-)  create mode
> > 100644 drivers/nvdimm/ocxl/Kconfig  create mode 100644
> > drivers/nvdimm/ocxl/Makefile  create mode 100644
> > drivers/nvdimm/ocxl/main.c  create mode 100644
> > drivers/nvdimm/ocxl/ocxlpmem.h  create mode 100644
> > drivers/nvdimm/ocxl/ocxlpmem_internal.c
> >  create mode 100644 include/uapi/nvdimm/ocxlpmem.h
> >
> > --
> > 2.24.1
> >


--=20
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece

