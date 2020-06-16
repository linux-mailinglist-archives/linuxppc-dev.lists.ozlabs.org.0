Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7232F1FA634
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 04:00:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mBGy4F2hzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 12:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IsnhpT3G; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IsnhpT3G; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mBDY5dgjzDqR2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 11:58:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592272679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=MZUCLAMZdmO5EM+jCfqRymLIPQ+NHghkczuzn6RqHtY=;
 b=IsnhpT3GAFxi0CPqBqlOuYfu9Px29KnkfJxyu5VNPZwmFu9a0Pz9kbVaTc1Opqa2QRXHF3
 CefxBghphbhq4I5zadaqeef1/+HYq5GY0RBbJgNWZL3EylqVYCZv2rKUZJD1oa1mjiKNCV
 SCzIPtnFyv2i6Twz5IR7u1ilCSxcsgo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592272679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=MZUCLAMZdmO5EM+jCfqRymLIPQ+NHghkczuzn6RqHtY=;
 b=IsnhpT3GAFxi0CPqBqlOuYfu9Px29KnkfJxyu5VNPZwmFu9a0Pz9kbVaTc1Opqa2QRXHF3
 CefxBghphbhq4I5zadaqeef1/+HYq5GY0RBbJgNWZL3EylqVYCZv2rKUZJD1oa1mjiKNCV
 SCzIPtnFyv2i6Twz5IR7u1ilCSxcsgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-kG50-M7xPwedRKQDZzJkIQ-1; Mon, 15 Jun 2020 21:57:57 -0400
X-MC-Unique: kG50-M7xPwedRKQDZzJkIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 182E77BB2;
 Tue, 16 Jun 2020 01:57:52 +0000 (UTC)
Received: from llong.com (ovpn-117-41.rdu2.redhat.com [10.10.117.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96E15768AE;
 Tue, 16 Jun 2020 01:57:43 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
Subject: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
Date: Mon, 15 Jun 2020 21:57:15 -0400
Message-Id: <20200616015718.7812-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, David Sterba <dsterba@suse.cz>,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 v4:
  - Break out the memzero_explicit() change as suggested by Dan Carpenter
    so that it can be backported to stable.
  - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
    now as there can be a bit more discussion on what is best. It will be
    introduced as a separate patch later on after this one is merged.

This patchset makes a global rename of the kzfree() to kfree_sensitive()
to highlight the fact buffer clearing is only needed if the data objects
contain sensitive information like encrpytion key. The fact that kzfree()
uses memset() to do the clearing isn't totally safe either as compiler
may compile out the clearing in their optimizer especially if LTO is
used. Instead, the new kfree_sensitive() uses memzero_explicit() which
won't get compiled out.

Waiman Long (3):
  mm/slab: Use memzero_explicit() in kzfree()
  mm, treewide: Rename kzfree() to kfree_sensitive()
  btrfs: Use kfree() in btrfs_ioctl_get_subvol_info()

 arch/s390/crypto/prng.c                       |  4 +--
 arch/x86/power/hibernate.c                    |  2 +-
 crypto/adiantum.c                             |  2 +-
 crypto/ahash.c                                |  4 +--
 crypto/api.c                                  |  2 +-
 crypto/asymmetric_keys/verify_pefile.c        |  4 +--
 crypto/deflate.c                              |  2 +-
 crypto/drbg.c                                 | 10 +++---
 crypto/ecc.c                                  |  8 ++---
 crypto/ecdh.c                                 |  2 +-
 crypto/gcm.c                                  |  2 +-
 crypto/gf128mul.c                             |  4 +--
 crypto/jitterentropy-kcapi.c                  |  2 +-
 crypto/rng.c                                  |  2 +-
 crypto/rsa-pkcs1pad.c                         |  6 ++--
 crypto/seqiv.c                                |  2 +-
 crypto/shash.c                                |  2 +-
 crypto/skcipher.c                             |  2 +-
 crypto/testmgr.c                              |  6 ++--
 crypto/zstd.c                                 |  2 +-
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  2 +-
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   |  4 +--
 drivers/crypto/atmel-ecc.c                    |  2 +-
 drivers/crypto/caam/caampkc.c                 | 28 +++++++--------
 drivers/crypto/cavium/cpt/cptvf_main.c        |  6 ++--
 drivers/crypto/cavium/cpt/cptvf_reqmanager.c  | 12 +++----
 drivers/crypto/cavium/nitrox/nitrox_lib.c     |  4 +--
 drivers/crypto/cavium/zip/zip_crypto.c        |  6 ++--
 drivers/crypto/ccp/ccp-crypto-rsa.c           |  6 ++--
 drivers/crypto/ccree/cc_aead.c                |  4 +--
 drivers/crypto/ccree/cc_buffer_mgr.c          |  4 +--
 drivers/crypto/ccree/cc_cipher.c              |  6 ++--
 drivers/crypto/ccree/cc_hash.c                |  8 ++---
 drivers/crypto/ccree/cc_request_mgr.c         |  2 +-
 drivers/crypto/marvell/cesa/hash.c            |  2 +-
 .../crypto/marvell/octeontx/otx_cptvf_main.c  |  6 ++--
 .../marvell/octeontx/otx_cptvf_reqmgr.h       |  2 +-
 drivers/crypto/mediatek/mtk-aes.c             |  2 +-
 drivers/crypto/nx/nx.c                        |  4 +--
 drivers/crypto/virtio/virtio_crypto_algs.c    | 12 +++----
 drivers/crypto/virtio/virtio_crypto_core.c    |  2 +-
 drivers/md/dm-crypt.c                         | 32 ++++++++---------
 drivers/md/dm-integrity.c                     |  6 ++--
 drivers/misc/ibmvmc.c                         |  6 ++--
 .../hisilicon/hns3/hns3pf/hclge_mbx.c         |  2 +-
 .../net/ethernet/intel/ixgbe/ixgbe_ipsec.c    |  6 ++--
 drivers/net/ppp/ppp_mppe.c                    |  6 ++--
 drivers/net/wireguard/noise.c                 |  4 +--
 drivers/net/wireguard/peer.c                  |  2 +-
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c  |  2 +-
 .../net/wireless/intel/iwlwifi/pcie/tx-gen2.c |  6 ++--
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c  |  6 ++--
 drivers/net/wireless/intersil/orinoco/wext.c  |  4 +--
 drivers/s390/crypto/ap_bus.h                  |  4 +--
 drivers/staging/ks7010/ks_hostif.c            |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 drivers/staging/wlan-ng/p80211netdev.c        |  2 +-
 drivers/target/iscsi/iscsi_target_auth.c      |  2 +-
 fs/btrfs/ioctl.c                              |  2 +-
 fs/cifs/cifsencrypt.c                         |  2 +-
 fs/cifs/connect.c                             | 10 +++---
 fs/cifs/dfs_cache.c                           |  2 +-
 fs/cifs/misc.c                                |  8 ++---
 fs/crypto/keyring.c                           |  6 ++--
 fs/crypto/keysetup_v1.c                       |  4 +--
 fs/ecryptfs/keystore.c                        |  4 +--
 fs/ecryptfs/messaging.c                       |  2 +-
 include/crypto/aead.h                         |  2 +-
 include/crypto/akcipher.h                     |  2 +-
 include/crypto/gf128mul.h                     |  2 +-
 include/crypto/hash.h                         |  2 +-
 include/crypto/internal/acompress.h           |  2 +-
 include/crypto/kpp.h                          |  2 +-
 include/crypto/skcipher.h                     |  2 +-
 include/linux/slab.h                          |  2 +-
 lib/mpi/mpiutil.c                             |  6 ++--
 lib/test_kasan.c                              |  6 ++--
 mm/slab_common.c                              | 10 +++---
 net/atm/mpoa_caches.c                         |  4 +--
 net/bluetooth/ecdh_helper.c                   |  6 ++--
 net/bluetooth/smp.c                           | 24 ++++++-------
 net/core/sock.c                               |  2 +-
 net/ipv4/tcp_fastopen.c                       |  2 +-
 net/mac80211/aead_api.c                       |  4 +--
 net/mac80211/aes_gmac.c                       |  2 +-
 net/mac80211/key.c                            |  2 +-
 net/mac802154/llsec.c                         | 20 +++++------
 net/sctp/auth.c                               |  2 +-
 net/sctp/socket.c                             |  2 +-
 net/sunrpc/auth_gss/gss_krb5_crypto.c         |  4 +--
 net/sunrpc/auth_gss/gss_krb5_keys.c           |  6 ++--
 net/sunrpc/auth_gss/gss_krb5_mech.c           |  2 +-
 net/tipc/crypto.c                             | 10 +++---
 net/wireless/core.c                           |  2 +-
 net/wireless/ibss.c                           |  4 +--
 net/wireless/lib80211_crypt_tkip.c            |  2 +-
 net/wireless/lib80211_crypt_wep.c             |  2 +-
 net/wireless/nl80211.c                        | 24 ++++++-------
 net/wireless/sme.c                            |  6 ++--
 net/wireless/util.c                           |  2 +-
 net/wireless/wext-sme.c                       |  2 +-
 scripts/coccinelle/free/devm_free.cocci       |  4 +--
 scripts/coccinelle/free/ifnullfree.cocci      |  4 +--
 scripts/coccinelle/free/kfree.cocci           |  6 ++--
 scripts/coccinelle/free/kfreeaddr.cocci       |  2 +-
 security/apparmor/domain.c                    |  4 +--
 security/apparmor/include/file.h              |  2 +-
 security/apparmor/policy.c                    | 24 ++++++-------
 security/apparmor/policy_ns.c                 |  6 ++--
 security/apparmor/policy_unpack.c             | 14 ++++----
 security/keys/big_key.c                       |  6 ++--
 security/keys/dh.c                            | 14 ++++----
 security/keys/encrypted-keys/encrypted.c      | 14 ++++----
 security/keys/trusted-keys/trusted_tpm1.c     | 34 +++++++++----------
 security/keys/user_defined.c                  |  6 ++--
 116 files changed, 322 insertions(+), 322 deletions(-)

-- 
2.18.1

