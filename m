Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451A63CBD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 00:28:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMJSK6gtQz3cJv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tZgRpw3L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tZgRpw3L;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMJNN277Nz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 10:25:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATMH6DN009962;
	Tue, 29 Nov 2022 23:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+gyXyUsX4kilIrul4pzFQT9/qDWpnd/x0Cp591ZxdSw=;
 b=tZgRpw3LcL/N1/2eoLt8K4OMf6KGFo9xKhMrU06s3Ze3Yr5+2HJ+alLwgNBNbfzdJhgp
 1Sh7xuLqnMYOaPHiA9hLNypJ6rVxr75JrPZG9p5vR2BlSI0funLUqEleVygee15KIrSz
 qYJhqawqGvONXkIJFcIh6BzVuqrfoGqExWCF+ha4YOlKAcDJ1/2Y6QGJIKEYUte8eK1B
 GEb1YW2u1u6sw9Nw3bgoy3UDbVw7CeJof+5RclFqoN0sNa9j5za80u/zlRCmOtBju2cB
 CeQUXzKzWRJn1BqbMIxYPQkvu28usOnbVmilt9v9wocETEdY+XBVS2rQUc8HB1mD4kuC Ow== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5r60nbw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 23:25:16 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATNK53e009154;
	Tue, 29 Nov 2022 23:25:15 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma02dal.us.ibm.com with ESMTP id 3m3ae9p1f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 23:25:15 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATNPErW47645288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 23:25:14 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8E8B5806A;
	Tue, 29 Nov 2022 23:25:13 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B12E5803F;
	Tue, 29 Nov 2022 23:25:12 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.99.100])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 23:25:12 +0000 (GMT)
From: gjoyce@linux.vnet.ibm.com
To: linux-block@vger.kernel.org
Subject: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
Date: Tue, 29 Nov 2022 17:25:06 -0600
Message-Id: <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s06jIYtTO-YxgM6hrEjfKpYTX3wYZLHs
X-Proofpoint-GUID: s06jIYtTO-YxgM6hrEjfKpYTX3wYZLHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290138
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
Cc: axboe@kernel.dk, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Extend the SED block driver so it can alternatively
obtain a key from a sed-opal kernel keyring. The SED
ioctls will indicate the source of the key, either
directly in the ioctl data or from the keyring.

This allows the use of SED commands in scripts such as
udev scripts so that drives may be automatically unlocked
as they become available.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
---
 block/Kconfig                 |   1 +
 block/sed-opal.c              | 174 +++++++++++++++++++++++++++++++++-
 include/linux/sed-opal.h      |   3 +
 include/uapi/linux/sed-opal.h |   8 +-
 4 files changed, 183 insertions(+), 3 deletions(-)

diff --git a/block/Kconfig b/block/Kconfig
index 444c5ab3b67e..b46f93ac8405 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -181,6 +181,7 @@ config BLK_DEBUG_FS_ZONED
 
 config BLK_SED_OPAL
 	bool "Logic for interfacing with Opal enabled SEDs"
+	depends on KEYS
 	help
 	Builds Logic for interfacing with Opal enabled controllers.
 	Enabling this option enables users to setup/unlock/lock
diff --git a/block/sed-opal.c b/block/sed-opal.c
index 993b2b7cc4c2..a8729892178b 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -20,6 +20,9 @@
 #include <linux/sed-opal.h>
 #include <linux/string.h>
 #include <linux/kdev_t.h>
+#include <linux/key.h>
+#include <linux/key-type.h>
+#include <keys/user-type.h>
 
 #include "opal_proto.h"
 
@@ -29,6 +32,8 @@
 /* Number of bytes needed by cmd_finalize. */
 #define CMD_FINALIZE_BYTES_NEEDED 7
 
+static struct key *sed_opal_keyring;
+
 struct opal_step {
 	int (*fn)(struct opal_dev *dev, void *data);
 	void *data;
@@ -265,6 +270,101 @@ static void print_buffer(const u8 *ptr, u32 length)
 #endif
 }
 
+/*
+ * Allocate/update a SED Opal key and add it to the SED Opal keyring.
+ */
+static int update_sed_opal_key(const char *desc, u_char *key_data, int keylen)
+{
+	key_ref_t kr;
+
+	if (!sed_opal_keyring)
+		return -ENOKEY;
+
+	kr = key_create_or_update(make_key_ref(sed_opal_keyring, true), "user",
+				  desc, (const void *)key_data, keylen,
+				  KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
+				  KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN |
+					KEY_ALLOC_BYPASS_RESTRICTION);
+	if (IS_ERR(kr)) {
+		pr_err("Error adding SED key (%ld)\n", PTR_ERR(kr));
+		return PTR_ERR(kr);
+	}
+
+	return 0;
+}
+
+/*
+ * Read a SED Opal key from the SED Opal keyring.
+ */
+static int read_sed_opal_key(const char *key_name, u_char *buffer, int buflen)
+{
+	int ret;
+	key_ref_t kref;
+	struct key *key;
+
+	if (!sed_opal_keyring)
+		return -ENOKEY;
+
+	kref = keyring_search(make_key_ref(sed_opal_keyring, true),
+			      &key_type_user, key_name, true);
+
+	if (IS_ERR(kref))
+		ret = PTR_ERR(kref);
+
+	key = key_ref_to_ptr(kref);
+	down_read(&key->sem);
+	ret = key_validate(key);
+	if (ret == 0) {
+		if (buflen > key->datalen)
+			buflen = key->datalen;
+
+		ret = key->type->read(key, (char *)buffer, buflen);
+	}
+	up_read(&key->sem);
+
+	key_ref_put(kref);
+
+	return ret;
+}
+
+static int opal_get_key(struct opal_dev *dev, struct opal_key *key)
+{
+	int ret = 0;
+
+	switch (key->key_type) {
+	case OPAL_INCLUDED:
+		/* the key is ready to use */
+		break;
+	case OPAL_KEYRING:
+		/* the key is in the keyring */
+		ret = read_sed_opal_key(OPAL_AUTH_KEY, key->key, OPAL_KEY_MAX);
+		if (ret > 0) {
+			if (ret > 255) {
+				ret = -ENOSPC;
+				goto error;
+			}
+			key->key_len = ret;
+			key->key_type = OPAL_INCLUDED;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	if (ret < 0)
+		goto error;
+
+	/* must have a PEK by now or it's an error */
+	if (key->key_type != OPAL_INCLUDED || key->key_len == 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+	return 0;
+error:
+	pr_debug("Error getting password: %d\n", ret);
+	return ret;
+}
+
 static bool check_tper(const void *data)
 {
 	const struct d0_tper_features *tper = data;
@@ -2269,6 +2369,9 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &opal_session->opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
@@ -2302,6 +2405,9 @@ static int opal_revertlsp(struct opal_dev *dev, struct opal_revert_lsp *rev)
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &rev->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
@@ -2320,6 +2426,9 @@ static int opal_erase_locking_range(struct opal_dev *dev,
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &opal_session->opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
@@ -2348,6 +2457,9 @@ static int opal_enable_disable_shadow_mbr(struct opal_dev *dev,
 	    opal_mbr->enable_disable != OPAL_MBR_DISABLE)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &opal_mbr->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
@@ -2373,6 +2485,9 @@ static int opal_set_mbr_done(struct opal_dev *dev,
 	    mbr_done->done_flag != OPAL_MBR_NOT_DONE)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &mbr_done->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
@@ -2394,6 +2509,9 @@ static int opal_write_shadow_mbr(struct opal_dev *dev,
 	if (info->size == 0)
 		return 0;
 
+	ret = opal_get_key(dev, &info->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
@@ -2450,6 +2568,9 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
 		return -EINVAL;
 	}
 
+	ret = opal_get_key(dev, &lk_unlk->session.opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
@@ -2472,6 +2593,10 @@ static int opal_reverttper(struct opal_dev *dev, struct opal_key *opal, bool psi
 
 	int ret;
 
+	ret = opal_get_key(dev, opal);
+
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	if (psid)
@@ -2534,6 +2659,9 @@ static int opal_lock_unlock(struct opal_dev *dev,
 	if (lk_unlk->session.who > OPAL_USER9)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &lk_unlk->session.opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	ret = __opal_lock_unlock(dev, lk_unlk);
 	mutex_unlock(&dev->dev_lock);
@@ -2556,6 +2684,9 @@ static int opal_take_ownership(struct opal_dev *dev, struct opal_key *opal)
 	if (!dev)
 		return -ENODEV;
 
+	ret = opal_get_key(dev, opal);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, owner_steps, ARRAY_SIZE(owner_steps));
@@ -2578,6 +2709,9 @@ static int opal_activate_lsp(struct opal_dev *dev,
 	if (!opal_lr_act->num_lrs || opal_lr_act->num_lrs > OPAL_MAX_LRS)
 		return -EINVAL;
 
+	ret = opal_get_key(dev, &opal_lr_act->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, active_steps, ARRAY_SIZE(active_steps));
@@ -2596,6 +2730,9 @@ static int opal_setup_locking_range(struct opal_dev *dev,
 	};
 	int ret;
 
+	ret = opal_get_key(dev, &opal_lrs->session.opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, lr_steps, ARRAY_SIZE(lr_steps));
@@ -2622,6 +2759,14 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
 	ret = execute_steps(dev, pw_steps, ARRAY_SIZE(pw_steps));
 	mutex_unlock(&dev->dev_lock);
 
+	if (ret)
+		return ret;
+
+	/* update keyring with new password */
+	ret = update_sed_opal_key(OPAL_AUTH_KEY,
+				  opal_pw->new_user_pw.opal_key.key,
+				  opal_pw->new_user_pw.opal_key.key_len);
+
 	return ret;
 }
 
@@ -2642,6 +2787,9 @@ static int opal_activate_user(struct opal_dev *dev,
 		return -EINVAL;
 	}
 
+	ret = opal_get_key(dev, &opal_session->opal_key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 	ret = execute_steps(dev, act_steps, ARRAY_SIZE(act_steps));
@@ -2728,6 +2876,9 @@ static int opal_generic_read_write_table(struct opal_dev *dev,
 {
 	int ret, bit_set;
 
+	ret = opal_get_key(dev, &rw_tbl->key);
+	if (ret)
+		return ret;
 	mutex_lock(&dev->dev_lock);
 	setup_opal_dev(dev);
 
@@ -2776,9 +2927,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
 	if (!dev)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 	if (!(dev->flags & OPAL_FL_SUPPORTED))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (cmd & IOC_IN) {
 		p = memdup_user(arg, _IOC_SIZE(cmd));
@@ -2854,3 +3005,22 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(sed_ioctl);
+
+static int __init sed_opal_init(void)
+{
+	struct key *kr;
+
+	kr = keyring_alloc(".sed_opal",
+			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
+			   (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
+			   KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
+			   KEY_ALLOC_NOT_IN_QUOTA,
+			   NULL, NULL);
+	if (IS_ERR(kr))
+		return PTR_ERR(kr);
+
+	sed_opal_keyring = kr;
+
+	return 0;
+}
+late_initcall(sed_opal_init);
diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
index 7131d7f0eec2..57d483506b4a 100644
--- a/include/linux/sed-opal.h
+++ b/include/linux/sed-opal.h
@@ -24,6 +24,9 @@ bool opal_unlock_from_suspend(struct opal_dev *dev);
 struct opal_dev *init_opal_dev(void *data, sec_send_recv *send_recv);
 int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *ioctl_ptr);
 
+#define	OPAL_AUTH_KEY           "opal-boot-pin"
+#define	OPAL_AUTH_KEY_PREV      "opal-boot-pin-prev"
+
 static inline bool is_sed_ioctl(unsigned int cmd)
 {
 	switch (cmd) {
diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
index fccde168e90c..6b79cdcf9518 100644
--- a/include/uapi/linux/sed-opal.h
+++ b/include/uapi/linux/sed-opal.h
@@ -44,10 +44,16 @@ enum opal_lock_state {
 	OPAL_LK = 0x04, /* 0100 */
 };
 
+enum opal_key_type {
+	OPAL_INCLUDED = 0,	/* key[] is the key */
+	OPAL_KEYRING,		/* key is in keyring */
+};
+
 struct opal_key {
 	__u8 lr;
 	__u8 key_len;
-	__u8 __align[6];
+	__u8 key_type;
+	__u8 __align[5];
 	__u8 key[OPAL_KEY_MAX];
 };
 
-- 
gjoyce@linux.vnet.ibm.com

