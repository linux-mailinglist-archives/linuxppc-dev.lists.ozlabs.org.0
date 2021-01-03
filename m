Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A45372E89DE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 02:37:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7hGY1ZbFzDqtj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 12:37:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.103;
 helo=mail-41103.protonmail.ch; envelope-from=skirmisher@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=B1+8CTe8; 
 dkim-atps=neutral
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7hDC04jjzDqrT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 12:35:55 +1100 (AEDT)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id DCD2D20025CC
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 01:35:51 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="B1+8CTe8"
Date: Sun, 03 Jan 2021 01:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1609637739;
 bh=qZNZ9nBES3QJsrohNACQf4zL9RxQEkRcEfIjqiJcAco=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=B1+8CTe8rR69Qdg/mP7johLk38DxqYFEk/KnYqmtkMlETWIp7n476mbNRK6XWtCJO
 Ez2t0B16ysqHFW5PwRTymprnmFq/j/KclpTnY70pUkmzko8JpHKHMGare8Fw2hHZy8
 YqTI9dVDwHOtJmnX7c82Hu/ebZw5f3w6nDgrlDzU=
To: linuxppc-dev@lists.ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: [PATCH 2/2] powerpc/compat_sys: swap hi/lo parts of 64-bit syscall
 args in LE mode
Message-ID: <2765111.e9J7NaK4W3@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Cc: eerykitty@gmail.com, daniel@octaforge.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Swap upper/lower 32 bits for 64-bit compat syscalls, conditioned on
endianness. This is modeled after the same functionality in
arch/mips/kernel/linux32.c.

This fixes compat_sys on ppc64le, when called by 32-bit little-endian
processes.

Tested with `file /bin/bash` (pread64) and `truncate -s 5G test`
(ftruncate64).

Signed-off-by: Will Springer <skirmisher@protonmail.com>
---
 arch/powerpc/kernel/sys_ppc32.c | 49 +++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc3=
2.c
index d36c6391eaf5..16ff0399a257 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -59,57 +59,64 @@ unsigned long compat_sys_mmap2(unsigned long addr, size=
_t len,
 /*=20
  * long long munging:
  * The 32 bit ABI passes long longs in an odd even register pair.
+ * High and low parts are swapped depending on endian mode,
+ * so define a macro (similar to mips linux32) to handle that.
  */
+#ifdef __LITTLE_ENDIAN__
+#define merge_64(low, high) ((u64)high << 32) | low
+#else
+#define merge_64(high, low) ((u64)high << 32) | low
+#endif
=20
 compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, comp=
at_size_t count,
-=09=09=09     u32 reg6, u32 poshi, u32 poslo)
+=09=09=09     u32 reg6, u32 pos1, u32 pos2)
 {
-=09return ksys_pread64(fd, ubuf, count, ((loff_t)poshi << 32) | poslo);
+=09return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
 }
=20
 compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubu=
f, compat_size_t count,
-=09=09=09      u32 reg6, u32 poshi, u32 poslo)
+=09=09=09      u32 reg6, u32 pos1, u32 pos2)
 {
-=09return ksys_pwrite64(fd, ubuf, count, ((loff_t)poshi << 32) | poslo);
+=09return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
 }
=20
-compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offhi, u32 offlo, =
u32 count)
+compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offse=
t2, u32 count)
 {
-=09return ksys_readahead(fd, ((loff_t)offhi << 32) | offlo, count);
+=09return ksys_readahead(fd, merge_64(offset1, offset2), count);
 }
=20
 asmlinkage int compat_sys_truncate64(const char __user * path, u32 reg4,
-=09=09=09=09unsigned long high, unsigned long low)
+=09=09=09=09unsigned long len1, unsigned long len2)
 {
-=09return ksys_truncate(path, (high << 32) | low);
+=09return ksys_truncate(path, merge_64(len1, len2));
 }
=20
-asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offhi, u32 offl=
o,
-=09=09=09=09     u32 lenhi, u32 lenlo)
+asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 of=
fset2,
+=09=09=09=09     u32 len1, u32 len2)
 {
-=09return ksys_fallocate(fd, mode, ((loff_t)offhi << 32) | offlo,
-=09=09=09     ((loff_t)lenhi << 32) | lenlo);
+=09return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
+=09=09=09     merge_64(len1, len2));
 }
=20
-asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned =
long high,
-=09=09=09=09 unsigned long low)
+asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned =
long len1,
+=09=09=09=09 unsigned long len2)
 {
-=09return ksys_ftruncate(fd, (high << 32) | low);
+=09return ksys_ftruncate(fd, merge_64(len1, len2));
 }
=20
-long ppc32_fadvise64(int fd, u32 unused, u32 offset_high, u32 offset_low,
+long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
 =09=09     size_t len, int advice)
 {
-=09return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low, len,
+=09return ksys_fadvise64_64(fd, merge_64(offset1, offset2), len,
 =09=09=09=09 advice);
 }
=20
 asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
-=09=09=09=09   unsigned offset_hi, unsigned offset_lo,
-=09=09=09=09   unsigned nbytes_hi, unsigned nbytes_lo)
+=09=09=09=09   unsigned offset1, unsigned offset2,
+=09=09=09=09   unsigned nbytes1, unsigned nbytes2)
 {
-=09loff_t offset =3D ((loff_t)offset_hi << 32) | offset_lo;
-=09loff_t nbytes =3D ((loff_t)nbytes_hi << 32) | nbytes_lo;
+=09loff_t offset =3D merge_64(offset1, offset2);
+=09loff_t nbytes =3D merge_64(nbytes1, nbytes2);
=20
 =09return ksys_sync_file_range(fd, offset, nbytes, flags);
 }
--=20
2.29.2





