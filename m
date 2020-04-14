Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E87761A873B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:16:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491sZv1sZVzDr3t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=18cIArH6; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491rzk23DXzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 02:49:06 +1000 (AEST)
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B77E221707;
 Tue, 14 Apr 2020 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586882943;
 bh=/za7QfBY5rqfFy5Fc86zEguQvM3DZ41F1j+QsDC5kAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=18cIArH6DXxU2OJ7VAhhT0Oy+EKeR+tfw6E5xIUpRL5V8ddsuhMLT48Erei4c3gDM
 tvhG3yXJfvBOm9iq2ahkTD9V91IjPPU9rbuNZunNSqvgAg6fWbRGOj5K1nYNPXbmyd
 /aO1hK/3xZsi5odLBnhFOp6+qU3IJ8xm2ZLq4gTo=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jOOk8-0068ld-Q4; Tue, 14 Apr 2020 18:49:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 09/33] docs: fix broken references to text files
Date: Tue, 14 Apr 2020 18:48:35 +0200
Message-Id: <6f919ddb83a33b5f2a63b6b5f0575737bb2b36aa.1586881715.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586881715.git.mchehab+huawei@kernel.org>
References: <cover.1586881715.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Akira Yokosawa <akiyks@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 linux-arch@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, kvm-ppc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Daniel Lustig <dlustig@nvidia.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Andrea Parri <parri.andrea@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Paul E. McKenney" <paulmck@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Luc Maranget <luc.maranget@inria.fr>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 David Howells <dhowells@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-rdma@vger.kernel.org, James Morse <james.morse@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Marc Zyngier <maz@kernel.org>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several references got broken due to txt to ReST conversion.

Several of them can be automatically fixed with:

	scripts/documentation-file-ref-check --fix

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> # hwtracing/coresight/Kconfig
Reviewed-by: Paul E. McKenney <paulmck@kernel.org> # memory-barrier.txt
Acked-by: Alex Shi <alex.shi@linux.alibaba.com> # translations/zh_CN
Acked-by: Federico Vaga <federico.vaga@vaga.pv.it> # translations/it_IT
Acked-by: Marc Zyngier <maz@kernel.org> # kvm/arm64
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/memory-barriers.txt                    |  2 +-
 Documentation/process/submit-checklist.rst           |  2 +-
 .../translations/it_IT/process/submit-checklist.rst  |  2 +-
 Documentation/translations/ko_KR/memory-barriers.txt |  2 +-
 .../translations/zh_CN/filesystems/sysfs.txt         |  2 +-
 .../translations/zh_CN/process/submit-checklist.rst  |  2 +-
 Documentation/virt/kvm/arm/pvtime.rst                |  2 +-
 Documentation/virt/kvm/devices/vcpu.rst              |  2 +-
 Documentation/virt/kvm/hypercalls.rst                |  4 ++--
 arch/powerpc/include/uapi/asm/kvm_para.h             |  2 +-
 drivers/gpu/drm/Kconfig                              |  2 +-
 drivers/gpu/drm/drm_ioctl.c                          |  2 +-
 drivers/hwtracing/coresight/Kconfig                  |  2 +-
 fs/fat/Kconfig                                       |  8 ++++----
 fs/fuse/Kconfig                                      |  2 +-
 fs/fuse/dev.c                                        |  2 +-
 fs/overlayfs/Kconfig                                 |  6 +++---
 include/linux/mm.h                                   |  4 ++--
 include/uapi/linux/ethtool_netlink.h                 |  2 +-
 include/uapi/rdma/rdma_user_ioctl_cmds.h             |  2 +-
 mm/gup.c                                             | 12 ++++++------
 virt/kvm/arm/vgic/vgic-mmio-v3.c                     |  2 +-
 virt/kvm/arm/vgic/vgic.h                             |  4 ++--
 23 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index e1c355e84edd..eaabc3134294 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -620,7 +620,7 @@ because the CPUs that the Linux kernel supports don't do writes
 until they are certain (1) that the write will actually happen, (2)
 of the location of the write, and (3) of the value to be written.
 But please carefully read the "CONTROL DEPENDENCIES" section and the
-Documentation/RCU/rcu_dereference.txt file:  The compiler can and does
+Documentation/RCU/rcu_dereference.rst file:  The compiler can and does
 break dependencies in a great many highly creative ways.
 
 	CPU 1		      CPU 2
diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index 8e56337d422d..3f8e9d5d95c2 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -107,7 +107,7 @@ and elsewhere regarding submitting Linux kernel patches.
     and why.
 
 26) If any ioctl's are added by the patch, then also update
-    ``Documentation/ioctl/ioctl-number.rst``.
+    ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
 
 27) If your modified source code depends on or uses any of the kernel
     APIs or features that are related to the following ``Kconfig`` symbols,
diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
index 995ee69fab11..3e575502690f 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -117,7 +117,7 @@ sottomissione delle patch, in particolare
     sorgenti che ne spieghi la logica: cosa fanno e perché.
 
 25) Se la patch aggiunge nuove chiamate ioctl, allora aggiornate
-    ``Documentation/ioctl/ioctl-number.rst``.
+    ``Documentation/userspace-api/ioctl/ioctl-number.rst``.
 
 26) Se il codice che avete modificato dipende o usa una qualsiasi interfaccia o
     funzionalità del kernel che è associata a uno dei seguenti simboli
diff --git a/Documentation/translations/ko_KR/memory-barriers.txt b/Documentation/translations/ko_KR/memory-barriers.txt
index 2e831ece6e26..e50fe6541335 100644
--- a/Documentation/translations/ko_KR/memory-barriers.txt
+++ b/Documentation/translations/ko_KR/memory-barriers.txt
@@ -641,7 +641,7 @@ P 는 짝수 번호 캐시 라인에 저장되어 있고, 변수 B 는 홀수 
 리눅스 커널이 지원하는 CPU 들은 (1) 쓰기가 정말로 일어날지, (2) 쓰기가 어디에
 이루어질지, 그리고 (3) 쓰여질 값을 확실히 알기 전까지는 쓰기를 수행하지 않기
 때문입니다.  하지만 "컨트롤 의존성" 섹션과
-Documentation/RCU/rcu_dereference.txt 파일을 주의 깊게 읽어 주시기 바랍니다:
+Documentation/RCU/rcu_dereference.rst 파일을 주의 깊게 읽어 주시기 바랍니다:
 컴파일러는 매우 창의적인 많은 방법으로 종속성을 깰 수 있습니다.
 
 	CPU 1		      CPU 2
diff --git a/Documentation/translations/zh_CN/filesystems/sysfs.txt b/Documentation/translations/zh_CN/filesystems/sysfs.txt
index ee1f37da5b23..a15c3ebdfa82 100644
--- a/Documentation/translations/zh_CN/filesystems/sysfs.txt
+++ b/Documentation/translations/zh_CN/filesystems/sysfs.txt
@@ -281,7 +281,7 @@ drivers/ 包含了每个已为特定总线上的设备而挂载的驱动程序
 假定驱动没有跨越多个总线类型)。
 
 fs/ 包含了一个为文件系统设立的目录。现在每个想要导出属性的文件系统必须
-在 fs/ 下创建自己的层次结构(参见Documentation/filesystems/fuse.txt)。
+在 fs/ 下创建自己的层次结构(参见Documentation/filesystems/fuse.rst)。
 
 dev/ 包含两个子目录： char/ 和 block/。在这两个子目录中，有以
 <major>:<minor> 格式命名的符号链接。这些符号链接指向 sysfs 目录
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 8738c55e42a2..50386e0e42e7 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -97,7 +97,7 @@ Linux内核补丁提交清单
 24) 所有内存屏障例如 ``barrier()``, ``rmb()``, ``wmb()`` 都需要源代码中的注
     释来解释它们正在执行的操作及其原因的逻辑。
 
-25) 如果补丁添加了任何ioctl，那么也要更新 ``Documentation/ioctl/ioctl-number.rst``
+25) 如果补丁添加了任何ioctl，那么也要更新 ``Documentation/userspace-api/ioctl/ioctl-number.rst``
 
 26) 如果修改后的源代码依赖或使用与以下 ``Kconfig`` 符号相关的任何内核API或
     功能，则在禁用相关 ``Kconfig`` 符号和/或 ``=m`` （如果该选项可用）的情况
diff --git a/Documentation/virt/kvm/arm/pvtime.rst b/Documentation/virt/kvm/arm/pvtime.rst
index 2357dd2d8655..687b60d76ca9 100644
--- a/Documentation/virt/kvm/arm/pvtime.rst
+++ b/Documentation/virt/kvm/arm/pvtime.rst
@@ -76,5 +76,5 @@ It is advisable that one or more 64k pages are set aside for the purpose of
 these structures and not used for other purposes, this enables the guest to map
 the region using 64k pages and avoids conflicting attributes with other memory.
 
-For the user space interface see Documentation/virt/kvm/devices/vcpu.txt
+For the user space interface see Documentation/virt/kvm/devices/vcpu.rst
 section "3. GROUP: KVM_ARM_VCPU_PVTIME_CTRL".
diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 9963e680770a..ca374d3fe085 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -110,5 +110,5 @@ Returns:
 
 Specifies the base address of the stolen time structure for this VCPU. The
 base address must be 64 byte aligned and exist within a valid guest memory
-region. See Documentation/virt/kvm/arm/pvtime.txt for more information
+region. See Documentation/virt/kvm/arm/pvtime.rst for more information
 including the layout of the stolen time structure.
diff --git a/Documentation/virt/kvm/hypercalls.rst b/Documentation/virt/kvm/hypercalls.rst
index dbaf207e560d..ed4fddd364ea 100644
--- a/Documentation/virt/kvm/hypercalls.rst
+++ b/Documentation/virt/kvm/hypercalls.rst
@@ -22,7 +22,7 @@ S390:
   number in R1.
 
   For further information on the S390 diagnose call as supported by KVM,
-  refer to Documentation/virt/kvm/s390-diag.txt.
+  refer to Documentation/virt/kvm/s390-diag.rst.
 
 PowerPC:
   It uses R3-R10 and hypercall number in R11. R4-R11 are used as output registers.
@@ -30,7 +30,7 @@ PowerPC:
 
   KVM hypercalls uses 4 byte opcode, that are patched with 'hypercall-instructions'
   property inside the device tree's /hypervisor node.
-  For more information refer to Documentation/virt/kvm/ppc-pv.txt
+  For more information refer to Documentation/virt/kvm/ppc-pv.rst
 
 MIPS:
   KVM hypercalls use the HYPCALL instruction with code 0 and the hypercall
diff --git a/arch/powerpc/include/uapi/asm/kvm_para.h b/arch/powerpc/include/uapi/asm/kvm_para.h
index be48c2215fa2..a809b1b44ddf 100644
--- a/arch/powerpc/include/uapi/asm/kvm_para.h
+++ b/arch/powerpc/include/uapi/asm/kvm_para.h
@@ -31,7 +31,7 @@
  * Struct fields are always 32 or 64 bit aligned, depending on them being 32
  * or 64 bit wide respectively.
  *
- * See Documentation/virt/kvm/ppc-pv.txt
+ * See Documentation/virt/kvm/ppc-pv.rst
  */
 struct kvm_vcpu_arch_shared {
 	__u64 scratch1;
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 43594978958e..fb92be7e8aa7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -161,7 +161,7 @@ config DRM_LOAD_EDID_FIRMWARE
 	  monitor are unable to provide appropriate EDID data. Since this
 	  feature is provided as a workaround for broken hardware, the
 	  default case is N. Details and instructions how to build your own
-	  EDID data are given in Documentation/driver-api/edid.rst.
+	  EDID data are given in Documentation/admin-guide/edid.rst.
 
 config DRM_DP_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 9e41972c4bbc..c2b8d2a953ae 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -741,7 +741,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
  *     };
  *
  * Please make sure that you follow all the best practices from
- * ``Documentation/ioctl/botching-up-ioctls.rst``. Note that drm_ioctl()
+ * ``Documentation/process/botching-up-ioctls.rst``. Note that drm_ioctl()
  * automatically zero-extends structures, hence make sure you can add more stuff
  * at the end, i.e. don't put a variable sized array there.
  *
diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 83e841be1081..02dbb5ca3bcf 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -107,7 +107,7 @@ config CORESIGHT_CPU_DEBUG
 	  can quickly get to know program counter (PC), secure state,
 	  exception level, etc. Before use debugging functionality, platform
 	  needs to ensure the clock domain and power domain are enabled
-	  properly, please refer Documentation/trace/coresight-cpu-debug.rst
+	  properly, please refer Documentation/trace/coresight/coresight-cpu-debug.rst
 	  for detailed description and the example for usage.
 
 config CORESIGHT_CTI
diff --git a/fs/fat/Kconfig b/fs/fat/Kconfig
index 718163d0c621..ca31993dcb47 100644
--- a/fs/fat/Kconfig
+++ b/fs/fat/Kconfig
@@ -69,7 +69,7 @@ config VFAT_FS
 
 	  The VFAT support enlarges your kernel by about 10 KB and it only
 	  works if you said Y to the "DOS FAT fs support" above.  Please read
-	  the file <file:Documentation/filesystems/vfat.txt> for details.  If
+	  the file <file:Documentation/filesystems/vfat.rst> for details.  If
 	  unsure, say Y.
 
 	  To compile this as a module, choose M here: the module will be called
@@ -82,7 +82,7 @@ config FAT_DEFAULT_CODEPAGE
 	help
 	  This option should be set to the codepage of your FAT filesystems.
 	  It can be overridden with the "codepage" mount option.
-	  See <file:Documentation/filesystems/vfat.txt> for more information.
+	  See <file:Documentation/filesystems/vfat.rst> for more information.
 
 config FAT_DEFAULT_IOCHARSET
 	string "Default iocharset for FAT"
@@ -96,7 +96,7 @@ config FAT_DEFAULT_IOCHARSET
 	  Note that "utf8" is not recommended for FAT filesystems.
 	  If unsure, you shouldn't set "utf8" here - select the next option
 	  instead if you would like to use UTF-8 encoded file names by default.
-	  See <file:Documentation/filesystems/vfat.txt> for more information.
+	  See <file:Documentation/filesystems/vfat.rst> for more information.
 
 	  Enable any character sets you need in File Systems/Native Language
 	  Support.
@@ -114,4 +114,4 @@ config FAT_DEFAULT_UTF8
 
 	  Say Y if you use UTF-8 encoding for file names, N otherwise.
 
-	  See <file:Documentation/filesystems/vfat.txt> for more information.
+	  See <file:Documentation/filesystems/vfat.rst> for more information.
diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index eb2a585572dc..774b2618018a 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -12,7 +12,7 @@ config FUSE_FS
 	  although chances are your distribution already has that library
 	  installed if you've installed the "fuse" package itself.
 
-	  See <file:Documentation/filesystems/fuse.txt> for more information.
+	  See <file:Documentation/filesystems/fuse.rst> for more information.
 	  See <file:Documentation/Changes> for needed library/utility version.
 
 	  If you want to develop a userspace FS, or if you want to use
diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 97eec7522bf2..c7a65cf2bcca 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -2081,7 +2081,7 @@ static void end_polls(struct fuse_conn *fc)
  * The same effect is usually achievable through killing the filesystem daemon
  * and all users of the filesystem.  The exception is the combination of an
  * asynchronous request and the tricky deadlock (see
- * Documentation/filesystems/fuse.txt).
+ * Documentation/filesystems/fuse.rst).
  *
  * Aborting requests under I/O goes as follows: 1: Separate out unlocked
  * requests, they should be finished off immediately.  Locked requests will be
diff --git a/fs/overlayfs/Kconfig b/fs/overlayfs/Kconfig
index 714c14c47ca5..dd188c7996b3 100644
--- a/fs/overlayfs/Kconfig
+++ b/fs/overlayfs/Kconfig
@@ -9,7 +9,7 @@ config OVERLAY_FS
 	  'lower' filesystem is either hidden or, in the case of directories,
 	  merged with the 'upper' object.
 
-	  For more information see Documentation/filesystems/overlayfs.txt
+	  For more information see Documentation/filesystems/overlayfs.rst
 
 config OVERLAY_FS_REDIRECT_DIR
 	bool "Overlayfs: turn on redirect directory feature by default"
@@ -38,7 +38,7 @@ config OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW
 	  If backward compatibility is not an issue, then it is safe and
 	  recommended to say N here.
 
-	  For more information, see Documentation/filesystems/overlayfs.txt
+	  For more information, see Documentation/filesystems/overlayfs.rst
 
 	  If unsure, say Y.
 
@@ -103,7 +103,7 @@ config OVERLAY_FS_XINO_AUTO
 	  If compatibility with applications that expect 32bit inodes is not an
 	  issue, then it is safe and recommended to say Y here.
 
-	  For more information, see Documentation/filesystems/overlayfs.txt
+	  For more information, see Documentation/filesystems/overlayfs.rst
 
 	  If unsure, say N.
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5a323422d783..1f2850465f59 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1219,7 +1219,7 @@ void unpin_user_pages(struct page **pages, unsigned long npages);
  * used to track the pincount (instead using of the GUP_PIN_COUNTING_BIAS
  * scheme).
  *
- * For more information, please see Documentation/vm/pin_user_pages.rst.
+ * For more information, please see Documentation/core-api/pin_user_pages.rst.
  *
  * @page:	pointer to page to be queried.
  * @Return:	True, if it is likely that the page has been "dma-pinned".
@@ -2834,7 +2834,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
  * releasing pages: get_user_pages*() pages must be released via put_page(),
  * while pin_user_pages*() pages must be released via unpin_user_page().
  *
- * Please see Documentation/vm/pin_user_pages.rst for more information.
+ * Please see Documentation/core-api/pin_user_pages.rst for more information.
  */
 
 static inline int vm_fault_to_errno(vm_fault_t vm_fault, int foll_flags)
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index 7fde76366ba4..1711e57f7848 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -2,7 +2,7 @@
 /*
  * include/uapi/linux/ethtool_netlink.h - netlink interface for ethtool
  *
- * See Documentation/networking/ethtool-netlink.txt in kernel source tree for
+ * See Documentation/networking/ethtool-netlink.rst in kernel source tree for
  * doucumentation of the interface.
  */
 
diff --git a/include/uapi/rdma/rdma_user_ioctl_cmds.h b/include/uapi/rdma/rdma_user_ioctl_cmds.h
index 7b1ec806f8f9..38ab7accb7be 100644
--- a/include/uapi/rdma/rdma_user_ioctl_cmds.h
+++ b/include/uapi/rdma/rdma_user_ioctl_cmds.h
@@ -36,7 +36,7 @@
 #include <linux/types.h>
 #include <linux/ioctl.h>
 
-/* Documentation/ioctl/ioctl-number.rst */
+/* Documentation/userspace-api/ioctl/ioctl-number.rst */
 #define RDMA_IOCTL_MAGIC	0x1b
 #define RDMA_VERBS_IOCTL \
 	_IOWR(RDMA_IOCTL_MAGIC, 1, struct ib_uverbs_ioctl_hdr)
diff --git a/mm/gup.c b/mm/gup.c
index 6076df8e04a4..81e4d0b377fd 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2843,9 +2843,9 @@ EXPORT_SYMBOL_GPL(get_user_pages_fast);
  * the arguments here are identical.
  *
  * FOLL_PIN means that the pages must be released via unpin_user_page(). Please
- * see Documentation/vm/pin_user_pages.rst for further details.
+ * see Documentation/core-api/pin_user_pages.rst for further details.
  *
- * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rst. It
+ * This is intended for Case 1 (DIO) in Documentation/core-api/pin_user_pages.rst. It
  * is NOT intended for Case 2 (RDMA: long-term pins).
  */
 int pin_user_pages_fast(unsigned long start, int nr_pages,
@@ -2883,9 +2883,9 @@ EXPORT_SYMBOL_GPL(pin_user_pages_fast);
  * the arguments here are identical.
  *
  * FOLL_PIN means that the pages must be released via unpin_user_page(). Please
- * see Documentation/vm/pin_user_pages.rst for details.
+ * see Documentation/core-api/pin_user_pages.rst for details.
  *
- * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rst. It
+ * This is intended for Case 1 (DIO) in Documentation/core-api/pin_user_pages.rst. It
  * is NOT intended for Case 2 (RDMA: long-term pins).
  */
 long pin_user_pages_remote(struct task_struct *tsk, struct mm_struct *mm,
@@ -2919,9 +2919,9 @@ EXPORT_SYMBOL(pin_user_pages_remote);
  * FOLL_PIN is set.
  *
  * FOLL_PIN means that the pages must be released via unpin_user_page(). Please
- * see Documentation/vm/pin_user_pages.rst for details.
+ * see Documentation/core-api/pin_user_pages.rst for details.
  *
- * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rst. It
+ * This is intended for Case 1 (DIO) in Documentation/core-api/pin_user_pages.rst. It
  * is NOT intended for Case 2 (RDMA: long-term pins).
  */
 long pin_user_pages(unsigned long start, unsigned long nr_pages,
diff --git a/virt/kvm/arm/vgic/vgic-mmio-v3.c b/virt/kvm/arm/vgic/vgic-mmio-v3.c
index e72dcc454247..859464fd413f 100644
--- a/virt/kvm/arm/vgic/vgic-mmio-v3.c
+++ b/virt/kvm/arm/vgic/vgic-mmio-v3.c
@@ -301,7 +301,7 @@ static unsigned long vgic_v3_uaccess_read_pending(struct kvm_vcpu *vcpu,
 	 * pending state of interrupt is latched in pending_latch variable.
 	 * Userspace will save and restore pending state and line_level
 	 * separately.
-	 * Refer to Documentation/virt/kvm/devices/arm-vgic-v3.txt
+	 * Refer to Documentation/virt/kvm/devices/arm-vgic-v3.rst
 	 * for handling of ISPENDR and ICPENDR.
 	 */
 	for (i = 0; i < len * 8; i++) {
diff --git a/virt/kvm/arm/vgic/vgic.h b/virt/kvm/arm/vgic/vgic.h
index 769e4802645e..64fcd7511110 100644
--- a/virt/kvm/arm/vgic/vgic.h
+++ b/virt/kvm/arm/vgic/vgic.h
@@ -42,7 +42,7 @@
 			    VGIC_AFFINITY_LEVEL(val, 3))
 
 /*
- * As per Documentation/virt/kvm/devices/arm-vgic-v3.txt,
+ * As per Documentation/virt/kvm/devices/arm-vgic-v3.rst,
  * below macros are defined for CPUREG encoding.
  */
 #define KVM_REG_ARM_VGIC_SYSREG_OP0_MASK   0x000000000000c000
@@ -63,7 +63,7 @@
 				      KVM_REG_ARM_VGIC_SYSREG_OP2_MASK)
 
 /*
- * As per Documentation/virt/kvm/devices/arm-vgic-its.txt,
+ * As per Documentation/virt/kvm/devices/arm-vgic-its.rst,
  * below macros are defined for ITS table entry encoding.
  */
 #define KVM_ITS_CTE_VALID_SHIFT		63
-- 
2.25.2

